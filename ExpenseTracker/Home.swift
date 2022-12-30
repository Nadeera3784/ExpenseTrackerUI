//
//  Home.swift
//  ExpenseTracker
//
//  Created by Nadeera Sampath on 2022-12-13.
//

import SwiftUI

struct Home: View {
    @StateObject var expenseViewModel: ExpenseViewModel = .init()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                HStack(spacing: 15) {
                    HStack {
                        Image("avatar")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        VStack(alignment: .leading) {
                            Text("Welcome!").font(.caption)
                                .foregroundColor(.gray)
                            Text("John Doe").font(.title2)
                                .fontWeight(.semibold)
                                .opacity(0.7)
                        }
                    }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    NavigationLink {
                        FilteredDetailView()
                            .environmentObject(expenseViewModel)
                    } label: {
                        Image(systemName: "hexagon.fill")
                            .foregroundColor(.gray)
                            .overlay(content: {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                                .padding(7)
                        })
                            .frame(width: 40, height: 40)
                            .background(Color.white, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                }
                ExpenseCard()
                    .environmentObject(expenseViewModel)
                Transactions()
            }
                .padding()
            
        }
            .background {
            Color("BG")
                .ignoresSafeArea()
        }
        

        .fullScreenCover(isPresented: $expenseViewModel.addNewExpense) {
            expenseViewModel.clearData()
        } content: {
            NewExpense()
                .environmentObject(expenseViewModel)
        }
        .overlay(alignment: .bottom) {
            //AddButton()
        }


    }
    // MARK: Transactions View
    @ViewBuilder
    func Transactions() -> some View {
        VStack(spacing: 15) {
            HStack() {
                Text("Transactions")
                    .font(.title2.bold())
                    .opacity(0.7)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)

                Spacer()

                Text("View All")
                    .font(.callout)
                    .opacity(0.7)
                    .padding(.bottom)
            }
            ForEach(expenseViewModel.expenses) { expense in
                // MARK: Transaction Card View
                TransactionCardView(expense: expense)
                    .environmentObject(expenseViewModel)
            }
        }
    }


    // NOTE: Add New Expense Button
    @ViewBuilder
    func AddButton() -> some View {
        HStack() {
            Button {
                expenseViewModel.addNewExpense.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 25, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 55, height: 55)
                    .background {
                        Circle()
                            .fill(
                                .linearGradient(colors: [
                                    Color("Gradient1"),
                                    Color("Gradient2"),
                                    Color("Gradient3"),
                                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    }
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 5, y: 5)
            }
            .padding()
        }
        
    }

}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

