//  TextInputView.swift
//  Created by Holger Hinzberg on 28.08.22.

import SwiftUI
@available(macOS 11.0, *)

public struct TextInputView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var inputText : String
    @State var description = "Please enter text here";
    
    // This action will be executed if the Submit Button is clicked
    private var submitAction :  (String) -> Void
    
    /// A View to enter a value
    /// - Parameters:
    ///   - defaultText: Default text for the first TextField. Empty String if no default Value needed
    ///   - description: Headertext / Description for the first TextField
    ///   - submitAction: Action to be executed when the Submit Button is clicked
    public init (defaultText : String, description : String = "", submitAction: @escaping (String) -> Void)
    {
        _inputText = State(initialValue: defaultText)
        if description != "" {
            _description = State(initialValue: description)
        }
        self.submitAction = submitAction
    }
    
    public var body: some View
    {
        VStack {
            Text(description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
            
            TextField("", text: $inputText)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
            
            HStack {
                Spacer()
                Button("Cancel") { self.presentationMode.wrappedValue.dismiss()}
                    .keyboardShortcut(.cancelAction)
                Button("Submit") {self.presentationMode.wrappedValue.dismiss()
                    submitAction(inputText)
                }.keyboardShortcut(.defaultAction)
            
            }.padding(EdgeInsets(top: 0, leading: 15, bottom: 15, trailing: 15))
        }.frame(width: 450)
    }
}

struct TextInputView_Previews: PreviewProvider {
    static var previews: some View {
        TextInputView(defaultText: "Hallo Welt") {_ in } 
    }
}
