struct SkipButton : View {
    var body: some View {
        HStack {
            Spacer() // pushes `Skip` to far right
            NavigationLink(destination: TurnOnNotifs()) {
                Text("Skip")
                    .font(Font.custom("OpenSans-Regular", size: 16))
                    .foregroundColor(.white)
                    .padding(.trailing, 5)
            }
        }
    }
}