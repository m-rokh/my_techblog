class ApiConstant{

  static const hostDlUrl ="https://techblog.sasansafari.com";
  static const baseUrl ="https://techblog.sasansafari.com/Techblog/api/";
  static const getHomeItems =baseUrl + "home/?command=index";
  static const getArticleList =baseUrl + "article/get.php?command=new&user_id=";
  static const publishedByMe =baseUrl + "/article/get.php?command=published_by_me&user_id=";
  static const getArticleInfo =baseUrl + "/Techblog/api/article/get.php?command=info&id=1&user_id=1";
  static const postRsgister =baseUrl + "register/action.php";
 
}