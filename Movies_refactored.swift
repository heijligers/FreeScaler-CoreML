            // Ensure the asset has video tracks
            guard asset.tracks(withMediaType: .video).count > 0 else {
                throw VideoConverterError.noVideoTracks
            }

enum VideoConverterError: Error {
    case noVideoTracks
}
