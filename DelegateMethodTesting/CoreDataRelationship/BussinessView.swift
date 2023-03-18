//
//  BussinessListView.swift
//  DelegateMethodTesting
//
//  Created by Kesavan Panchabakesan on 14/03/23.
//

import SwiftUI

struct BusinessView: View {
    @State private var businessName = ""
    @StateObject var viewModel = BusinessViewModel.shared
    var body: some View {
        NavigationView {
            VStack{
                Form{
                    HStack{
                        Text("Company name:")
                        TextField("Required", text: $businessName)
                    }
                    HStack{
                        Spacer()
                        Button("Add company", action: {
                            viewModel.addCompany(companyName: self.businessName)
                            self.businessName = ""
                        })
                            .disabled(self.businessName.isEmpty || self.businessName.count < 3)
                        Spacer()
                    }
                    Section("Company list") {
                        ForEach(viewModel.businesses, id: \.self) { entity in
                            BussinessListView(entity: entity)
                        }
                    }
                }
            }.navigationTitle("Companies")
            Spacer()
        }
    }
}

struct BussinessListView: View {
    let entity: BusinessEntity
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("Name: \(entity.name ?? "")")
                    .bold()
                if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                    HStack {
                        Text("Department:")
                        ForEach(departments, id: \.self) { department in
                            Text(department.name ?? "")
                        }
                    }
                }
                
                if let empolyees = entity.empolyees?.allObjects as? [EmpolyeeEntity] {
                    HStack {
                        Text("Empolyees:")
                        ForEach(empolyees, id: \.self) { empolyee in
                            Text(empolyee.name ?? "")
                        }
                    }
                }
            }
            Spacer()
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct BussinessListView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessView()
    }
}
