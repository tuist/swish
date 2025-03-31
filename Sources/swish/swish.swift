import ArgumentParser

@main
struct Swish: AsyncParsableCommand {
//    @Flag(help: "Include a counter with each repetition.")
//    var includeCounter = false
//
//    @Option(name: .shortAndLong, help: "The number of times to repeat 'phrase'.")
//    var count: Int? = nil
//
//    @Argument(help: "The phrase to repeat.")
//    var phrase: String

    mutating func run() throws {
        print("Hello world")
    }
}
