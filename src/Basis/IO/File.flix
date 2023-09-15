/*
 * Copyright 2023 Stephen Tetley
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


mod Basis.IO {

    ///
    /// Represents a File.
    pub enum File(##java.io.File)

}

mod Basis.IO.File {


    use Basis.IO.File
    use Basis.IO.File.{File}
    use Basis.IO.Path
    use Basis.IO.Path.{Path}

    pub def toPath(file: File): Result[String, Path] =
        Result.tryCatch(_ -> {
            import java.io.File.toPath(): ##java.nio.file.Path \ {};
            let File(file1) = file;
            Path(toPath(file1))
        })

}
