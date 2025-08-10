

const defaultConfig = {
  baseUrl: "",
  timeout: 3000,
  headers: {
    "Content-Type": "application/json",
  },
};

class HttpRequest {
  constructor(params = {}) {
    this.config = Object.assign({}, defaultConfig, params || {});
  }

  getUrl(params) {
    let requestUrl = this.config.baseUrl;
    if (requestUrl.endsWith("/")) {
      requestUrl.substring(0, requestUrl.length - 1);
    }
    let url = params.url;
    if (!url.startsWith("/")) {
      url = `/${url}`;
    }
    return `${requestUrl}${url}`;
  }

  createError(params = { code: -1, msg: "" }) {
    return {
      errorCode: params.code,
      errorMsg: params.msg,
    };
  }

  request(params = { method: "GET", headers: {} }) {
    return new Promise((resolve, reject) => {
      const xhr = new XMLHttpRequest();
      const headers = Object.assign(
        {},
        this.config.headers || {},
        params.headers || {}
      );
      Object.keys(headers).forEach((key) => {
        // console.log(key,headers[key])
        // xhr.setRequestHeader(key, headers[key]);
      });
      xhr.timeout = this.config.timeout;
      xhr.onreadystatechange = () => {
        if (xhr.readyState === XMLHttpRequest.DONE) {
          // 请求完成
          if (xhr.status === 200) {
            // 成功响应
            resolve({
              code: xhr.status,
              data: JSON.parse(xhr.responseText),
            });
          } else {
            reject(
              this.createError({
                code: xhr.status,
                msg: xhr.statusText,
              })
            );
          }
        }
      };
      xhr.onerror = () => {
        reject(
          this.createError({ code: -1, msg: "网络错误: 无法连接到服务器" })
        );
      };
      xhr.open(params.method.toLocaleUpperCase(), this.getUrl(params));

      xhr.send();
    });
  }

  get(url) {
    return this.request({
      url,
      method: "get",
    });
  }
  post() {}
}

export const request = new HttpRequest({ baseUrl: "https://cnodejs.org/api/v1" });
