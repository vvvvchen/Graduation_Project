import SwiftUI

struct ForumView: View
{
    // Circle大小
    let circleSize: CGFloat = 50
    // 設定發文每行可輸入的字數
    let maxCharactersPerLine = 16
    // 展開搜索列設為FALSE
    @State private var isSearching = false
    // 預設輸入
    @State private var userInput: String = "寫寫您想說的話......"
    // 控制點按加號後會出現的Zstack
    @State private var isExpanded = false
    // 發送提示框
    @State private var isConfirmationAlertPresented = false

    
    @State private var selectedImage: UIImage?

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
                                .offset(x: UIScreen.main.bounds.width/2-213.6, y: 0)
                                .overlay
                            {
                                Image(systemName: "magnifyingglass")
                                    .resizable()
                                    .scaledToFit()
                                    .offset(x: UIScreen.main.bounds.width/2-210.6, y: 0)
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
                                .offset(x: UIScreen.main.bounds.width/2-203.6, y: 0)
                        }
                        // MARK: 採購清單
                        Button(action:
                                {
                            // 開啟採購清單功能
                        }) {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 27))
                                .foregroundColor(.white)
                                .offset(x: UIScreen.main.bounds.width/2-193, y: 0)
                        }
                    }
                    .offset(x: UIScreen.main.bounds.width/2-190, y: 0)
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
                            .fill(Color(red: 0.976, green: 0.837, blue: 0.710))
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        
                        Circle()
                            .fill(Color.orange)
                            .frame(width: circleSize, height: circleSize)
                            .offset(x: UIScreen.main.bounds.width/2-330, y: -250)
                        
                        Text("品瑞")
                            .font(.system(size: 20))
                            .offset(x: -80, y: -250)
                        
                        TextEditor(text: $userInput)
                            .frame(width: 300, height: 200)
                            .background(Color.white)
                            .foregroundColor(.gray)
                            .padding()
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                            .offset(y: -90)
                            .onTapGesture
                        {
                                    if userInput == "寫寫您想說的話......"
                                {
                                        userInput = ""
                                    }
                                }
                        
                        Button(action:
                                {
                            print("按鈕被點擊了")
                        }) {
                            Circle()
                                .frame(width: 55,height: 55)
                                .foregroundColor(Color.orange)
                                .overlay(
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .font(.system(size: 30))
                                )
                        }
                        .position(x: UIScreen.main.bounds.width/2-120, y: UIScreen.main.bounds.height/2+60)
                        
                        Button(action:
                                {
                            // 檢查 userInput 是否為空
                            if !userInput.isEmpty
                            {
                                // 顯示確認發送的警示框
                                isConfirmationAlertPresented = true
                            }
                            else
                            {
                                // 如果 userInput 為空，顯示警告
                                // 這裡可以自行處理如何提醒用戶輸入不可為空
                                print("請輸入內容")
                            }
                        }) {
                            Text("發送")
                                .font(.headline)
                                .padding()
                                .background(userInput.isEmpty ? Color.gray : Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .position(x: UIScreen.main.bounds.width/2+110, y: UIScreen.main.bounds.height/2+60)
                    }
                    .alert(isPresented: $isConfirmationAlertPresented)
                    {
                        Alert(
                            title: Text("確認發送"),
                            message: Text("確定要發送這篇文章嗎？"),
                            primaryButton: .default(Text("確定"))
                            {
                                // 在這裡處理確定發送的操作
                                print("文章已發送")
                                // 關閉警示框
                                isConfirmationAlertPresented = false
                            },
                            secondaryButton: .cancel(Text("取消"))
                            {
                                // 關閉警示框
                                isConfirmationAlertPresented = false
                            }
                        )
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
