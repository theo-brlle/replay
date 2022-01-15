extension GetProgramsByCategoryRequestResponse.Data.Programs.Item: ProgramDataRepresentable {
    var thumbailURLs: [String] {
        return self.decoration.image.sources.map { $0.url }
    }
}
