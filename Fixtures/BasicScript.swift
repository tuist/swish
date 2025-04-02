enum Script {
    static func main() async throws {
        print("Hello world")
    }
}

#if SWISH_MAIN
    await Script.main()
#endif
