/// 资源工具
/// @author lizhid
/// @version V1.0.0
/// @date 2019/6/19
class ResourceUtil {
  /// 获取asset中图片路径
  /// @param name
  /// @return String
  /// @author lizhid
  /// @modify
  /// @date 2019/6/19 21:18
  static String getAssetImagePath(String name) {
    if (name.isEmpty) {
      return "";
    }
    return "assets/images/" + name;
  }
}
