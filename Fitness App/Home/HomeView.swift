//
//  HomeView.swift
//  Fitness App
//
//  Created by Tovah Marx on 3/3/25.
//

import SwiftUI

struct HomeView: View {
    @State var calories: Int = 123
    @State var active: Int = 52
    @State var stand: Int = 8
    
   var mockActivities = [
    Activity(id: 0, title: "Today's Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .green, amount: "9812"),
    Activity(id: 1, title: "Today's Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .red, amount: "1035"),
    Activity(id: 2, title: "Today's Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .blue, amount: "8523"),
    Activity(id: 3, title: "Today's Steps", subtitle: "Goal 12,000", image: "figure.walk", tintColor: .purple, amount: "7356"),
   ]
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading) {
                Text("Welcome")
                    .font(.largeTitle)
                    .padding()
                
                HStack {
                    Spacer()
                    
                    VStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Calories")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.red)
                            
                            Text("123 kcal")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Active")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.green)
                            
                            Text("52 mins")
                                .bold()
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Stand")
                                .font(.callout)
                                .bold()
                                .foregroundColor(.blue)
                            
                            Text("8 hours")
                                .bold()
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        ProgressCircleView(progress: $calories, goal: 600, color: .red)
                        
                        ProgressCircleView(progress: $active, goal: 60, color: .green)
                            .padding(.all, 20)
                        
                        ProgressCircleView(progress: $stand, goal: 12, color: .blue)
                            .padding(.all, 40)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding()
                
                HStack {
                    Text("Fitness Activity")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        print("Show More")
                    } label: {
                        Text("Show More")
                            .padding(.all, 10)
                            .foregroundColor(.white)
                            .background(.black)
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                    ForEach(mockActivities, id: \.id) { activity in
                        ActivityCard(activity: activity)
                    }
                }
                .padding(.horizontal)
                    
                }
            }
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }


