/// 请求类型枚举
/// @author lizhid
/// @version V1.0.0
/// @date 2019/5/23
enum RequestTypeEnum {
  /// 请求网络
  NET,
  /// 先请求缓存，再请求网络
  CACHE_AND_NET,

  /// 先请求缓存，缓存不存在请求网络
  CACHE_OR_NET,

  /// 请求缓存
  CACHE
}
