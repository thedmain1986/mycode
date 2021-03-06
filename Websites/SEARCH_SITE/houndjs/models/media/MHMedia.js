import MHObject from '../base/MHObject.js';

import MHRelationalPair from '../container/MHRelationalPair.js';
import { MHMediaMetadata } from '../meta/MHMetadata.js';

import houndRequest from '../../request/hound-request.js';

// MediaHound Media Object
export default class MHMedia extends MHObject {
  get jsonProperties() {
    return {
      ...super.jsonProperties,
      metadata: MHMediaMetadata,
      keyContributors: [MHRelationalPair],
      keyTraits: [MHRelationalPair],
      keySuitabilities: [MHRelationalPair],
      primaryGroup: MHRelationalPair
    };
  }

  static get rootEndpoint() { return 'graph/media'; }

  /* TODO: DocJS
  * mhMed.fetchContent()
  *
  * @param force { Boolean } - force refetch of content
  * @return { Promise } - resolves to
  *
  */

  fetchContent(view='full', size=20, force=false) {
    const path = this.subendpoint('content');
    return this.fetchPagedEndpoint(path, view, size, force);
  }

  /* TODO: DocJS
   * mhMed.fetchSources()
   *
   * @param force { Boolean } - force refetch of content
   * @return { Promise } - resolves to
   *
   */
  fetchSources(view='full', size=20, force=false) {
    const path = this.subendpoint('sources');
    return this.fetchPagedEndpoint(path, view, size, force);
  }

  /**
  * mhObj.fetchContributors(mhid,force)
  *
  * @param { string='full' } view - the view needed to depict each MHObject that is returned
  * @param { number=12     } size  - the number of items to return per page
  * @param { Boolean=false } force
  *
  * @return { houndPagedRequest }  - MediaHound paged request object for this feed
  *
  */

  fetchContributors(view='full', size=12, force=false) {
    const path = this.subendpoint('contributors');
    return this.fetchPagedEndpoint(path, view, size, force);
  }

  fetchIVATrailer() {
    const path = this.subendpoint('ivaTrailer');

    const cached = this.cachedResponseForPath(path);
    if (cached) {
      return cached;
    }

    const promise = houndRequest({
      method: 'GET',
      endpoint: path
    });

    this.setCachedResponse(promise, path);

    return promise;
  }


  /**
  * mhObj.fetchRelated(mhid,force)
  *
  * @param { string='full' } view - the view needed to depict each MHObject that is returned
  * @param { number=0      } page - the zero indexed page number to return
  * @param { number=12     } size  - the number of items to return per page
  * @param { Boolean=false } force
  *
  * @return { houndPagedRequest }  - MediaHound paged request object for this feed
  *
  */
  fetchRelated(view='full', size=12, force=false) {
    const path = this.subendpoint('related');
    return this.fetchPagedEndpoint(path, view, size, force);
  }

  static fetchRelatedTo(medias, filters={}, view='full', size=12, force=false, promote) {
    const factors = medias.map(m => {
      if (typeof m === 'string' || m instanceof String) {
        return m;
      }
      else if ('metadata' in m) {
        return m.metadata.mhid;
      }
      else {
        return m;
      }
    });
    const path = this.rootSubendpoint('related');
    const params = {
      factors: JSON.stringify(factors),
      filters: JSON.stringify(filters)
    };

    if (promote) {
      params.promote = JSON.stringify(promote);
    }

    return this.fetchRootPagedEndpoint(path, params, view, size, force);
  }

  /**
  * mhObj.fetchShortestDistance(otherMhid)
  *
  * @param { otherMhid } otherMhid - the MHID for the object to calculate shortest path.
  *
  * @return { Number }  - Returns the shortest distance between the two objects.
  *                       If there is no path between the two objects, returns `null`.
  *
  */
  fetchShortestDistance(otherMhid) {
    const path = this.subendpoint('shortestPath/' + otherMhid);
    return houndRequest({
      method: 'GET',
      endpoint: path
    }).then(function(response) {
      // This method returns an array of shortest paths.
      // Since we only care about the length, we can look at the first
      // shortest path and calculate its length.
      // The path includes both the start and mhid.
      // We do not count the start as a 'step', so we subtract one.
      return response.paths[0].path.length - 1;
    }).catch(function(err) {
      if (err.xhr.status === 404) {
        // A 404 indicates there is no path between the two nodes.
        return null;
      }
      else {
        throw err;
      }
    });
  }
}
