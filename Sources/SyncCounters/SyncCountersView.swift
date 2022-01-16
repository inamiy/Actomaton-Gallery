import SwiftUI
import ActomatonStore
import Counter

@MainActor
public struct SyncCountersView: View
{
    private let store: Store<SyncCounters.Action, SyncCounters.State>.Proxy

    public init(store: Store<SyncCounters.Action, SyncCounters.State>.Proxy)
    {
        self.store = store
    }

    public var body: some View
    {
        VStack {
            ForEach(store: store.children) { childStore in
                CounterView(
                    store: childStore
                        .counterState
                        .contramap(action: SyncCounters.Action.child)
                )
            }

            Spacer()

            HStack {
                Spacer()

                Button(action: { store.send(.addChild) }) {
                    Text("Add")
                }
                .disabled(!store.state.canAddChild)

                Spacer(minLength: 20)

                Button(action: { store.send(.removeChild) }) {
                    Text("Remove")
                }
                .disabled(!store.state.canRemoveChild)

                Spacer()
            }
            .font(.title)
        }
    }
}

struct SyncCountersView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SyncCountersView(
            store: .init(
                state: .constant(.init()),
                send: { _ in }
            )
        )
            .previewLayout(.sizeThatFits)
    }
}
