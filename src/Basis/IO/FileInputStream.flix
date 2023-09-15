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

    pub enum FileInputStream(##java.io.FileInputStream)

}

mod Basis.IO.FileInputStream {

    use Monad.{>>=}

    use Basis.IO.FileInputStream
    use Basis.IO.FileInputStream.{FileInputStream}
    use Basis.IO.Path
    use Basis.IO.Path.{Path}
    use Basis.IO.File.{File}
    use Basis.IO.FileChannel
    use Basis.IO.FileChannel.{FileChannel}

    pub def new(path: Path): Result[String, FileInputStream] \ IO = 
        Basis.IO.Path.toFile(path) >>= file ->
        Result.tryCatch(_ -> {
            import new java.io.FileInputStream(##java.io.File): ##java.io.FileInputStream \ IO as newFileInputStream;
            let File(file1) = file;
            FileInputStream(newFileInputStream(file1))
        })


    pub def getChannel(s: FileInputStream): FileChannel \ IO = 
        import java.io.FileInputStream.getChannel(): ##java.nio.channels.FileChannel \ IO;
        let FileInputStream(s1) = s;
        FileChannel(getChannel(s1))

    pub def close!(s: FileInputStream): Result[String, Unit] \ IO = 
        Result.tryCatch(_ -> {
            import java.io.FileInputStream.close(): Unit \ IO;
            let FileInputStream(s1) = s;
            close(s1)
        })

    pub def readByte!(s: FileInputStream): Result[String, Int32] \ IO = 
        Result.tryCatch(_ -> {
            import java.io.FileInputStream.read(): Int32 \ IO;
            let FileInputStream(s1) = s;
            read(s1)
        })


}
