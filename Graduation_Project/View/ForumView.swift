import SwiftUI

struct ForumView: View
{
    // Circle大小
    let circleSize: CGFloat = 50
    // 設定發文每行可輸入的字數
    let maxCharactersPerLine = 16
    // 展開搜索列設為FALSE
    @State private var isSearching = false
    // 預設輸入時沒有東西
    @State private var userInput: String = ""
    // 控制點按加號後會出現的Zstack
    @State private var isExpanded = false

    var body: some View
    {
        ZStack
        {
            // 包住加號和發佈貼文
            VStack
            {
                VStack(spacing: 0)
                {
                    // 第一個視圖
                    HStack
                    {
                        Button(action:
                                {
                            // 展開搜索列設為TRUE
                            isSearching = true
                        }) {
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color(red: 0.961, green: 0.804, blue: 0.576))
                                .frame(width: 270, height: 35, alignment: .leading)
                                .overlay
                            {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .frame(height: 20)
                                    .padding(.horizontal, 10)
                            }
                        }
                        // MARK: 分享加號
                        Button(action:
                                {
                            // 開啟加號功能
                            isExpanded = true
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 35))
                                .foregroundColor(.white)
                        }
                        // MARK: 採購清單
                        Button(action:
                                {
                            // 開啟採購清單功能
                        }) {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 27))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(10)
                }
                // MARK: 最上方搜尋列和清單或加號的背景調整
                .frame(width:400)
                .background(Color(.systemOrange))
                //                .background(Color(.orange))
                .padding(.bottom, -10)
                .fullScreenCover(isPresented: $isSearching)
                {
                    SearchView(isSearching: $isSearching)
                }

                // MARK: 發布文章區
                .sheet(isPresented: $isExpanded)
                {
                    ZStack
                    {
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 300, height: 400)
                        
                        Circle()
                            .fill(Color.blue)
                            .frame(width: circleSize, height: circleSize)
                            .offset(x: -100, y: -140)
                        
                        Text("品瑞")
                            .font(.headline)
                            .offset(x: -50, y: -140)
                        
                        TextEditor(text: $userInput)
                            .frame(width: 200, height: 150)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding()
                        
                        Button(action:
                                {
                            isExpanded = false
                            print("按鈕被點擊了")
                        }) {
                            Text("按鈕")
                                .font(.headline)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .offset(x: 100, y: 160)
                        }
                    }
                    .zIndex(1)
                }
                // MARK: 因為分享VIEW沒東西所以放SPACER 之後有東西的話可以刪掉
                Spacer()
            }
        }
    }
}

struct ForumView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ForumView()
    }
}
