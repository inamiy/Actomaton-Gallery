public struct WorldConfiguration: Equatable
{
    public var showsVelocityArrows: Bool
    public var showsForceArrows: Bool

    public init(
        showsVelocityArrows: Bool = false,
        showsForceArrows: Bool = false
    )
    {
        self.showsVelocityArrows = showsVelocityArrows
        self.showsForceArrows = showsForceArrows
    }
}
