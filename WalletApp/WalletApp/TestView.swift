//
//  TestView.swift
//  WalletApp
//
//  Created by Sameera Shah on 2/14/24.
//

import SwiftUI

struct TestView: View {
    @State var name:String = ""
    @State var bank:String = ""
    @State var type:String = "Visa"
    @State var rawNumber:String = ""
    @State var number:String = ""
    @State var security:String = ""
    @State var isShowingPassword: Bool = false
    @State var selectedDate = Date()
    @State var size1:CGFloat = 50
    @State var size2:CGFloat = 50
    @State var size3:CGFloat = 50
    @State var size4:CGFloat = 50
    @State var selectedColor: Color = .blue
    @State var showCard = false
    let types = ["Visa", "Mastercard", "Amex", "Discover"]
    
    var body: some View {
        VStack{
            Text("Add Card")
                .multilineTextAlignment(.leading)
                .bold()
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            Form{
                Section("Signature"){
                    TextField("Card Holder Name", text: $name)
                        .autocorrectionDisabled()
                    TextField("Bank", text: $bank)
                        .autocorrectionDisabled()
                    Picker("Card Type", selection: $type) {
                        ForEach(types, id: \.self) { type in
                            Text(type).tag(type)
                        }.pickerStyle(.automatic)
                    }
                }
                Section("Details"){
                    TextField("Card Number", text: $number)
                        .keyboardType(.numberPad)
                        .onChange(of: number) { newValue in
                            if newValue.count > 19 {
                                number = String(newValue.prefix(16))
                            }
                            number = formatNumber(newValue)
                            
                            let filtered = newValue.filter { "0123456789".contains($0) }
                            rawNumber = filtered

                        }
                    HStack{
                        if(isShowingPassword){
                            TextField("Security Code", text: $security)
                                .keyboardType(.numberPad)
                                .onChange(of: security) { value in
                                    if value.count > 3 {
                                        security = String(value.prefix(3))
                                    }
                                }
                        }
                        else{
                            SecureField("Security Code", text: $security)
                                .keyboardType(.numberPad)
                                .onChange(of: security) { value in
                                    if value.count > 3 {
                                        security = String(value.prefix(3))
                                    }
                                }
                        }
                        Button(action: {
                            isShowingPassword.toggle()
                        }) {
                            Image(systemName: self.isShowingPassword ? "eye" : "eye.slash")
                                .accentColor(.gray)
                        }
                    }
                    DatePicker(
                        "Valid Through",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                }
                Section("Card Color"){
                    HStack{
                        Spacer()
                        Circle()
                            .fill(Color.blue)
                            .frame(width: size1, height: size1)
                            .onTapGesture {
                                selectedColor = .blue
                                size1 = 60
                                size2 = 50
                                size3 = 50
                                size4 = 50
                            }
                        Spacer()
                        Circle()
                            .fill(Color.pink)
                            .frame(width: size2, height: size2)
                            .onTapGesture {
                                selectedColor = .pink
                                size2 = 60
                                size1 = 50
                                size3 = 50
                                size4 = 50
                            }
                        Spacer()
                        Circle()
                            .fill(Color.gray)
                            .frame(width: size3, height: size3)
                            .onTapGesture {
                                selectedColor = .gray
                                size3 = 60
                                size1 = 50
                                size2 = 50
                                size4 = 50
                            }
                        Spacer()
                        Circle()
                            .fill(Color.black)
                            .frame(width: size4, height: size4)
                            .onTapGesture {
                                selectedColor = .black
                                size4 = 60
                                size2 = 50
                                size3 = 50
                                size1 = 50
                            }
                        Spacer()
                    }
                }
                Section {
                    Button("Add Card to Wallet"){
                        showCard = true;
                    }.padding(.trailing).frame(alignment: .center)
                }
            }
            .sheet(isPresented: $showCard) {
                Rectangle()
                    .fill(selectedColor)
                    .frame(width: 350, height: 250)
                    .cornerRadius(10.0)
                    .overlay(
                        VStack{
                            HStack{
                                Text(bank)
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                Spacer()
                                Text(type)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            HStack{
                                Text(name)
                                    .bold()
                                    .font(.title)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            Spacer()
                            HStack{
                                Text("Valid Thru: \(formattedDate())")
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Secure Code \(security)")
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            HStack{
                                Text(number)
                                    .foregroundColor(.white)
                                    .font(.body.monospacedDigit())
                                Spacer()
                            }
                            Spacer()
                        }.padding()
                    )
            }

        }

    }
    
    func formatNumber(_ string: String) -> String {
        var number = string
        if string.count == 4 {
                number.insert(" ", at: number.index(number.startIndex, offsetBy: 4))
        }
        else if string.count == 9 {
                number.insert(" ", at: number.index(number.startIndex, offsetBy: 9))
        }
        else if string.count == 14 {
                number.insert(" ", at: number.index(number.startIndex, offsetBy: 14))
        }
        return number
    }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yy"
        return dateFormatter.string(from: selectedDate)
    }
}

#Preview {
    TestView()
}


