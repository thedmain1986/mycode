import MHObject from '../base/MHObject.js';

export default class MHSilo {
  static fetchSuggestedSilos(filters, view='full', size=10, siloPageSize=10, promote) {
    const path = 'graph/silo/suggested';
    const params = {
      siloPageSize
    };
    if (filters) {
      params.filters = filters;
    }
    if (promote) {
      params.promote = promote;
    }
    return MHObject.fetchRootBucketedEndpoint(path, view, size, null, params);
  }
}
