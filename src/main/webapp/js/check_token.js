function parseJwt(token) {
  /**
   * @description : decode jwt token into json
   */
  var base64Url = token.split('.')[1];
  var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
  var jsonPayload = decodeURIComponent(atob(base64).split('').map(function (c) {
    return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
  }).join(''));

  return String(jsonPayload);
}
function getCookie(name) {
  /**
   * @description : get cookie by its name
   */
  var tk_decode=null;
  if(document.cookie!=""){
    const value = document.cookie.split(';');
  value.forEach(function(ele){
    if(ele.split('=')[0]==='access_token'){
      // console.log(ele.split('=')[1]);
      tk_decode = parseJwt(ele.split('=')[1]);
      // console.log(tk_decode);
    }
  });
  }
  return tk_decode;
}
function checkToken(url, redirect) {
  /**
   * @description: neu token valid,  set redirect = true neu muon redretc sang trang moi, redirect = false neu o lai trang hien tai
   * @param url : string
   * @param redirect : boolean
   */
  var cookie =  JSON.parse(getCookie('access_token'));
  // console.log(cookie.exp*1000);
  // console.log(new Date().getTime());
  if((new Date().getTime() < cookie.exp * 1000 && redirect==true) || (new Date().getTime() > cookie.exp * 1000 && redirect==false)){
    location.replace(url);
  }
  else if((new Date().getTime() < cookie.exp * 1000 && redirect==false) || (new Date().getTime() > cookie.exp * 1000 && redirect==true)){
    return;
  }

  return;

  // alert(cookie);
}