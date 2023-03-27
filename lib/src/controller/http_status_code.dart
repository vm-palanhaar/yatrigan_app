enum HttpStatusAction {
  ok,
  badRequest,
  unauthorized,
  forbidden,
  notFound,
  internalServerError,
}

enum ResAction {
  success,
  failure,
}

Map<HttpStatusAction, ResAction> resAction = {
  HttpStatusAction.ok: ResAction.success,
  HttpStatusAction.badRequest: ResAction.failure,
  HttpStatusAction.unauthorized: ResAction.failure,
  HttpStatusAction.forbidden: ResAction.failure,
  HttpStatusAction.notFound: ResAction.failure,
  HttpStatusAction.internalServerError: ResAction.failure,
};

Map<int, HttpStatusAction> httpStatus = {
  200: HttpStatusAction.ok,
  201: HttpStatusAction.ok,
  202: HttpStatusAction.ok,
  204: HttpStatusAction.ok,
  400: HttpStatusAction.badRequest,
  401: HttpStatusAction.unauthorized,
  403: HttpStatusAction.forbidden,
  404: HttpStatusAction.notFound,
  500: HttpStatusAction.internalServerError,
};