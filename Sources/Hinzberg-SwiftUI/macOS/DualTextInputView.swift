//  DualTextInputView.swift
//  Created by Holger Hinzberg on 14.09.22.

import SwiftUI
@available(macOS 11.0, *)

struct DualTextInputView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var inputText1 : String
    @State var inputText2 : String
    @State var description1 = "Please enter text 1 here";
    @State var description2 = "Please enter text 2 here";
    
    // This action will be executed if the Submit Button is clicked
    private var submitAction :  ((text1: String, text2: String)) -> Void
    
    /// A View to enter two values
    /// - Parameters:
    ///   - defaultText1: Default text for the first TextField. Empty String if no default Value needed
    ///   - description1: Headertext / Description for the first TextField
    ///   - defaultText2: Default text for the second Textfield. Empty String if no default Value needed
    ///   - description2:Headertext / Description for the second TextField
    ///   - submitAction: Action to be executed when the Submit Button is clicked
    public init (defaultText1 : String, description1: String = "",  defaultText2 : String, description2 : String = ""
                 , submitAction: @escaping ((text1: String, text2: String)) -> Void)
    {
        _inputText1 = State(initialValue: defaultText1)
        _inputText2 = State(initialValue: defaultText2)
        
        if description1 != "" {
            _description1 = State(initialValue: description1)
        }
        
        if description2 != "" {
            _description2 = State(initialValue: description2)
        }
        
        self.submitAction = submitAction
    }
    
    public var body: some View
    {
        VStack {
            Text(description1)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
            TextField("", text: $inputText1)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            
            Text(description2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
            TextField("", text: $inputText2)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
       
            HStack {
                Spacer()
                Button("Cancel") { self.presentationMode.wrappedValue.dismiss()}
                    .keyboardShortcut(.cancelAction)
                Button("Submit") {self.presentationMode.wrappedValue.dismiss()
                    submitAction((inputText1, inputText2))
                }.keyboardShortcut(.defaultAction)
            
            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
        }.frame(width: 450)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DualTextInputView(defaultText1: "Hallo Welt" , defaultText2: "Hello World") {_ in }
    }
}
