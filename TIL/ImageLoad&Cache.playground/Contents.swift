import UIKit

/*:
 # KingFisher에서 확인한 내용
 
 ## 초기 접근
 setImage -> retrieveImage -> loadAndCacheImage
 
 ## 캐싱
 -> cacheImage
 
 ## 로딩
 -> downloadImage -> startDownloadTask
 
 -> let imageResult = result.map { ImageLoadingResult(image: $0, url: context.url, originalData: data) }
 
   let queue = callback.options.callbackQueue

   queue.execute { callback.onCompleted?.call(imageResult) }
 
 -> callback으로 result값을 인자로 가지고 setImage로 다시 돌아옴
 */
