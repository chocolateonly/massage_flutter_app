import 'package:common_utils/common_utils.dart';
import 'package:sharesdk_plugin/sharesdk_plugin.dart';

import 'bs_return.dart';
import 'package:oktoast/oktoast.dart';

class BSMobShare {
  static BSMobShare _instance;
  static ShareSDKRegister _register;

  static BSMobShare getInstance() {
    if (_instance == null) {
      _instance = BSMobShare();
      _instance._initSdkRegister();
    }
    return _instance;
  }

  // 初始化注册
  void _initSdkRegister() {
    _register = ShareSDKRegister();
  }

  // 初始化微信
  void initWechat(String appId, String appSecret, String appUniversalLink) {
    _register.setupWechat(appId, appSecret, appUniversalLink);
    SharesdkPlugin.regist(_register);
  }

  // 初始化 QQ
  void initQQ(String appId, String appKey) {
    _register.setupQQ(appId, appKey);
    SharesdkPlugin.regist(_register);
  }

  // 初始化 Facebook
  void initFacebook(String appId, String appKey, String displayName) {
    _register.setupFacebook(appId, appKey, displayName);
    SharesdkPlugin.regist(_register);
  }

  // 分享
  void share(
    int platform, // 1、微信 2、微信朋友圈 3、QQ 4、QQ空间
    String title, // 标题
    String text, // 描述
    {
    String image = 'http://www.beisheng.org/uploads/admin/image/2019-08-21/5d5cfe95a4508.jpg', // 图片
    String url = 'http://www.beisheng.org', // 跳转链接
    Function result, // 回调Function{}
    int contentType = 3, // 分享类型
  }) {
    ShareSDKPlatform sdkPlatform = _getSharePlatform(platform);
    _isInstall(platform).then((value) {
      if (value) {
        SSDKMap params = SSDKMap()..setGeneral(title, text, [image], image, null, url, url, null, null, null, _getShareType(contentType));

        SharesdkPlugin.share(sdkPlatform, params, (SSDKResponseState state, Map userdata, Map contentEntity, SSDKError error) {
          result(_getShareRetrun(state, error.rawData));
        });
      } else {
        LogUtil.v('${sdkPlatform.name} Client Is Not Install！');
      }
    });
  }

  // 获取授权信息
  void auth(int platform, Function result) async {
    ShareSDKPlatform sdkPlatform = _getSharePlatform(platform);
    _isInstall(platform).then((value) {
      if (value) {
        SharesdkPlugin.getUserInfo(sdkPlatform, (SSDKResponseState state, Map user, SSDKError error) {
          var userJson = _getAuthInfoReturn(platform, user);
          print("userJson:" + userJson.toString());
          result(_getShareRetrun(state, user != null ? userJson : error.rawData));
        });
      } else {
        String errMsg = '${sdkPlatform.name} Client Is Not Install！';
        showToast(errMsg);
        result(_getShareRetrun(null, errMsg));
        LogUtil.v(errMsg);
      }
    });
  }

  // 平台应用是否安装
  Future _isInstall(int platform) async {
    return await SharesdkPlugin.isClientInstalled(_getSharePlatform(platform)).then((value) {
      return (value['state'] ??= '') == 'installed';
    });
  }

  // 获取授权后的信息
  static _getAuthInfoReturn(int platform, Map authInfo) {
    if (authInfo == null) return null;
    String info = '';
    switch (platform) {
      case 1:
      case 3:
      case 5:
      case 6:
        info = authInfo['dbInfo'];
        break;
    }
    return info;
  }

  /*
   * 获取分享到的平台
   */
  static _getSharePlatform(int platform) {
    ShareSDKPlatform sdkPlatform;
    switch (platform) {
      case 1: // 微信
        sdkPlatform = ShareSDKPlatforms.wechatSession;
        break;
      case 2: // 微信朋友圈
        sdkPlatform = ShareSDKPlatforms.wechatTimeline;
        break;
      case 3: // QQ
        sdkPlatform = ShareSDKPlatforms.qq;
        break;
      case 4: // QQ空间
        sdkPlatform = ShareSDKPlatforms.qZone;
        break;
      case 5: // line
        sdkPlatform = ShareSDKPlatforms.line;
        break;
      case 6: // facebook
        sdkPlatform = ShareSDKPlatforms.facebook;
        break;
      default: // 微信
        sdkPlatform = ShareSDKPlatforms.wechatSession;
        break;
    }
    return sdkPlatform;
  }

  /*
   * 获取分享内容的类型
   */
  static _getShareType(int contentType) {
    SSDKContentType sdkContentType;
    switch (contentType) {
      case 1: // 文字
        sdkContentType = SSDKContentTypes.text;
        break;
      case 2: // 图片
        sdkContentType = SSDKContentTypes.image;
        break;
      case 3: // 网页 图文
        sdkContentType = SSDKContentTypes.webpage;
        break;
      case 4: // APP
        sdkContentType = SSDKContentTypes.app;
        break;
      case 5: // 音频
        sdkContentType = SSDKContentTypes.audio;
        break;
      case 6: // 视频
        sdkContentType = SSDKContentTypes.video;
        break;
      case 7: // 文件
        sdkContentType = SSDKContentTypes.file;
        break;
      case 8: // 小程序
        sdkContentType = SSDKContentTypes.miniProgram;
        break;
      default: // 网页 图文
        sdkContentType = SSDKContentTypes.webpage;
        break;
    }
    return sdkContentType;
  }

  /*
   * 获取分享结果 
   */
  static _getShareRetrun(state, data) {
    BSReturn ret;
    switch (state) {
      case SSDKResponseState.Success:
        print("ssssss:" + ret.toString());
        ret = BSReturn.getData('200', 'Success', data);
        print("ssssss:" + ret.toString());
        break;
      case SSDKResponseState.Fail:
      case SSDKResponseState.Cancel:
        ret = BSReturn.getData('400', '', data);
        break;
      default:
        ret = BSReturn.getData('400', 'Fail', data);
        break;
    }
    return ret;
  }
}
