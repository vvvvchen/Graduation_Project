import SwiftUI
import Charts

// 血壓紀錄
struct HypertensionRecord: Identifiable
{
    var id = UUID()
    var hypertension: Double
    var date: Date
    
    init(hypertension: Double)
    {
        self.hypertension = hypertension
        self.date = Date()
    }
}

// 包含ID和高血壓相關紀錄數組
struct HypertensionTemperatureSensor: Identifiable
{
    var id: String
    var records: [HypertensionRecord]
}

// 存取TemperatureSensor數據
var HypertensionallSensors: [HypertensionTemperatureSensor] = [
    .init(id: "血壓值", records: [])
]

// MARK: 日期func
private func formattedDate(_ date: Date) -> String
{
    let formatter = DateFormatter()
    formatter.dateFormat = "MM-dd HH:mm"
    return formatter.string(from: date)
}

struct HypertensionView: View
{
    @State private var hypertension: String = ""
    @State private var chartData: [HypertensionRecord] = []
    @State private var isShowingList: Bool = false
    @State private var scrollToBottom: Bool = false
    
    var body: some View
    {
        NavigationView
         {
            VStack(spacing: 30)
             {
                GeometryReader
                 {
                     geometry in
                    ScrollView(.horizontal, showsIndicators: false)
                     {
                        ScrollViewReader
                         {
                             scrollViewProxy in
                            Chart(HypertensionallSensors)
                             {
                                 sensor in
                                ForEach(chartData)
                                 {
                                     record in
                                    LineMark(
                                        x: .value("Hour", formattedDate(record.date)),
                                        y: .value("Value", record.hypertension)
                                    )
                                    .lineStyle(.init(lineWidth: 5))
                                    
                                    PointMark(
                                        x: .value("Hour", formattedDate(record.date)),
                                        y: .value("Value", record.hypertension)
                                    )
                                    .annotation(position: .top) {
                                        Text("\(record.hypertension, specifier: "%.2f")")
                                            .font(.system(size: 12))
                                            .foregroundColor(Color("textcolor"))
                                    }
                                }
                                .foregroundStyle(by: .value("Location", sensor.id))
                                .symbol(by: .value("Sensor Location", sensor.id))
                                .symbolSize(100)
                            }
                            .chartForegroundStyleScale([
                                "血壓值": .orange
                            ])
                            .frame(width: max(geometry.size.width, CGFloat(chartData.count) * 80), height: 200)
                            .onAppear
                             {
                                if scrollToBottom
                                 {
                                    scrollViewProxy.scrollTo(chartData.count - 1)
                                    scrollToBottom = false
                                }
                            }
                        }
                    }
                }
                
                Text("血壓值輸入")
                    .font(.system(size: 20, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .foregroundColor(Color("textcolor"))
                
                VStack(spacing: -5)
                 {
                    TextField("請輸入血壓值", text: $hypertension)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 330)
                        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification))
                     {
                         _ in
                        }
                    
                    Button(action:
                            {
                        if let hypertensionValue = Double(hypertension)
                        {
                            let newRecord = HypertensionRecord(hypertension: hypertensionValue)
                            chartData.append(newRecord)
                            hypertension = ""
                            //將標誌設為 true，以便滾動到底部
                            scrollToBottom = true
                        }
                    }) {
                        Text("紀錄血壓")
                            .foregroundColor(Color("textcolor"))
                            .padding(10)
                            .frame(width: 300, height: 50)
                            .background(Color(hue: 0.031, saturation: 0.803, brightness: 0.983))
                            .cornerRadius(100)
                            .font(.title3)
                    }
                    .padding()
                }
            }
            .navigationTitle("血壓紀錄")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    Button(action:
                            {
                        isShowingList.toggle()
                    }) {
                        Image(systemName: "list.dash")
                            .font(.title)
                            .foregroundColor(Color(hue: 0.031, saturation: 0.803, brightness: 0.983))
                    }
                }
            }
            .sheet(isPresented: $isShowingList)
             {
                HypertensionRecordsListView(records: $chartData)
            }
        }
    }
}

struct HypertensionRecordsListView: View
{
    @Binding var records: [HypertensionRecord]

    var body: some View
    {
        NavigationView
        {
            List
            {
                ForEach(records)
                {
                    record in
                    NavigationLink(destination: EditHypertensionRecordView(record: $records[records.firstIndex(where: { $0.id == record.id })!])) {
                        Text("\(formattedDate(record.date)): \(record.hypertension, specifier: "%.2f")")
                    }
                }
                .onDelete(perform: deleteRecord)
            }
            .navigationTitle("血壓紀錄列表")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing)
                {
                    EditButton()
                }
            }
        }
    }

    private func deleteRecord(at offsets: IndexSet)
    {
        records.remove(atOffsets: offsets)
    }
}

struct EditHypertensionRecordView: View
{
    @Binding var record: HypertensionRecord
    @State private var editedHypertension: String = ""
    @Environment(\.presentationMode) var presentationMode

    var body: some View
    {
        VStack
        {
            TextField("血壓值", text: $editedHypertension)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .onAppear
            {
                    editedHypertension = String(record.hypertension)
                }

            Button("保存") {
                if let editedValue = Double(editedHypertension)
                {
                    record.hypertension = editedValue
                }
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
        .navigationTitle("編輯血壓值")
    }
}

struct HypertensionView_Previews: PreviewProvider
{
    static var previews: some View
    {
        HypertensionView()
    }
}
