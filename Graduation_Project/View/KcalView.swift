import SwiftUI

// 卡路里紀錄
struct FoodItem: Identifiable
{
    let id = UUID()
    var name: String
    var calories: Double
    var timestamp: Date
    var isEditing = false
    var tempName: String = ""
    var tempCalories: String = ""
}

//含食物和卡路里相關紀錄數組
struct KcalView: View
{
    @State private var foodName = ""
    @State private var calories = ""
    @State private var foodList: [FoodItem] = []
    @State private var totalCalories = 0.0
    
    //設置日期格式和時間格式
    var dateFormatter: DateFormatter
    {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View
    {
        VStack
        {
            Text("卡路里記錄")
                .font(.title)
                .padding()
            //原先輸入的地方
            HStack
            {
                TextField("食物名稱", text: $foodName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                TextField("請輸入卡路里", text: $calories)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    //只允許輸入數字
                    .keyboardType(.numberPad)
                    .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification))
                {
                    _ in
                    //輸入非數字，會幫你直接清空
                    calories = calories.filter
                    {
                        "0123456789.".contains($0)
                    }
                }
            }
            
            Button(action:
                    {
                if let caloriesValue = Double(calories)
                {
                    let newFoodItem = FoodItem(name: foodName, calories: caloriesValue, timestamp: Date())
                    // 在列表的開頭插入新的食物項
                    foodList.insert(newFoodItem, at: 0)
                    totalCalories += caloriesValue
                    // 清空輸入
                    foodName = ""
                    calories = ""
                }
            }) {
                Text("新增食物")
                    .foregroundColor(Color("textcolor"))
            }
            
            //MARK: 使用者輸入後顯示的列表
            List(foodList)
            {
                item in
                HStack
                {
                    //編輯模式給使用者輸入的文本區域
                    if item.isEditing
                    {
                        TextField("新的食物名稱", text: $foodList[foodList.firstIndex(where: { $0.id == item.id })!].tempName)
                        TextField("新的卡路里", text: $foodList[foodList.firstIndex(where: { $0.id == item.id })!].tempCalories)
                            .keyboardType(.numberPad)
                    }
                    //非編輯模式下給使用者顯示的列表
                    else
                    {
                        VStack(alignment: .leading)
                        {
                            Text("\(item.name): \(item.calories, specifier: "%.2f") kcal")
                            Text("\(item.timestamp, formatter: dateFormatter)")
                                .font(.caption)
                        }
                    }
                    
                    Spacer()
                    
                    //判斷是否是當天輸入，是當天輸入才可以進行編輯
                    if Calendar.current.isDate(item.timestamp, inSameDayAs: Date())
                    {
                        
                        if item.isEditing
                        {
                            Button(action:
                                    {
                                //在編輯模式時顯示儲存，可以更改並保存內容
                                foodList[foodList.firstIndex(where: { $0.id == item.id })!].name = foodList[foodList.firstIndex(where:{ $0.id == item.id })!].tempName
                                foodList[foodList.firstIndex(where: { $0.id == item.id })!].calories = Double(foodList[foodList.firstIndex(where: { $0.id == item.id })!].tempCalories) ?? 0
                                foodList[foodList.firstIndex(where: { $0.id == item.id })!].isEditing = false
                            }) {
                                Text("儲存")
                                    .foregroundColor(Color(red: 1, green: 0.477, blue: 0.33))
                            }
                        }
                        else
                        {
                            Button(action:
                                    {
                                //在非編輯模式時顯示編輯下，點按可以進入編輯模式進行修改
                                foodList[foodList.firstIndex(where: { $0.id == item.id })!].isEditing.toggle()
                                foodList[foodList.firstIndex(where: { $0.id == item.id })!].tempName = item.name
                                foodList[foodList.firstIndex(where: { $0.id == item.id })!].tempCalories = "\(item.calories)"
                            }) {
                                Text("編輯")
                                    .foregroundColor(Color(red: 1, green: 0.477, blue: 0.33))
                            }
                        }
                        Button(action:
                                {
                            //刪除食物操作
                            deleteFood(item)
                        }) {
                            //垃圾桶
                            Image(systemName: "trash")
                                .foregroundColor(Color(red: 0.8, green: 0.477, blue: 0.33))
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .padding()
            }
            
            Text("總卡路里： \(totalCaloriesForToday, specifier: "%.2f") kcal")
                .font(.headline)
                .padding()
            
            Spacer()
        }
        .padding()
    }
    
    var totalCaloriesForToday: Double
    {
        let currentDate = Date()
        return foodList.filter
        {
            Calendar.current.isDate($0.timestamp, inSameDayAs: currentDate)
        }
        .reduce(0)
        {
            $0 + $1.calories
        }
    }
    
    //從foodList中刪除特定的食物項目
    func deleteFood(_ item: FoodItem)
    {
        //判斷是否是當天輸入，是當天輸入才可以進行編刪除
        if Calendar.current.isDate(item.timestamp, inSameDayAs: Date())
        {
            totalCalories -= item.calories
            if let index = foodList.firstIndex(where: { $0.id == item.id })
            {
                foodList.remove(at: index)
            }
        }
        else
        {
            print("只能刪除當天的輸入內容")
        }
    }
}

struct KcalView_Previews: PreviewProvider
{
    static var previews: some View
    {
        KcalView()
    }
}
