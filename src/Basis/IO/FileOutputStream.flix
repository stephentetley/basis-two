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

    pub enum FileOutputStream(##java.io.FileOutputStream)

}

mod Basis.IO.FileOutputStream {

    use Monad.{>>=}

    use Basis.IO.FileOutputStream
    use Basis.IO.FileOutputStream.{FileOutputStream}
    use Basis.IO.Path
    use Basis.IO.Path.{Path}
    use Basis.IO.File.{File}

    pub def new(path: Path): Result[String, FileOutputStream] \ IO = 
        Basis.IO.Path.toFile(path) >>= file ->
        Result.tryCatch(_ -> {
            import new java.io.FileOutputStream(##java.io.File): ##java.io.FileOutputStream \ IO as newFileOutputStream;
            let File(file1) = file;
            FileOutputStream(newFileOutputStream(file1))
        })

    pub def write!(b: Int32, s: FileOutputStream): Result[String, Unit] \ IO = 
        Result.tryCatch(_ -> {
            import java.io.FileOutputStream.write(Int32): Unit \ IO;
            let FileOutputStream(s1) = s;
            write(s1, b)
        })


}
