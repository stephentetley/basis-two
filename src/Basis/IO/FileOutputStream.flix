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
    use IOError.Generic

    use Basis.IO.FileOutputStream
    use Basis.IO.FileOutputStream.{FileOutputStream}
    use Basis.IO.OutputStream
    use Basis.IO.OutputStream.{OutputStream}
    use Basis.IO.Path
    use Basis.IO.Path.{Path}
    use Basis.IO.File.{File}
    use Basis.IO.FileChannel
    use Basis.IO.FileChannel.{FileChannel}

    pub def new(path: Path): Result[IOError, FileOutputStream] \ IO = 
        Result.mapErr(Generic, Basis.IO.Path.toFile(path)) >>= file ->
        IOError.tryCatch(_ -> {
            import new java.io.FileOutputStream(##java.io.File): ##java.io.FileOutputStream \ IO as newFileOutputStream;
            let File(file1) = file;
            FileOutputStream(newFileOutputStream(file1))
        })

    /// Should this be in IO ?
    pub def asOutputStream(s: FileOutputStream): OutputStream[Static] \ IO = 
        let FileOutputStream(s1) = s;
        checked_ecast(OutputStream(checked_cast(s1)))


    pub def getChannel(s: FileOutputStream): FileChannel \ IO = 
        import java.io.FileOutputStream.getChannel(): ##java.nio.channels.FileChannel \ IO;
        let FileOutputStream(s1) = s;
        FileChannel(getChannel(s1))

    pub def writeByte!(b: Int32, s: FileOutputStream): Result[IOError, Unit] \ IO = 
        IOError.tryCatch(_ -> {
            import java.io.FileOutputStream.write(Int32): Unit \ IO;
            let FileOutputStream(s1) = s;
            write(s1, b)
        })

    pub def close!(s: FileOutputStream): Result[IOError, Unit] \ IO = 
        IOError.tryCatch(_ -> {
            import java.io.FileOutputStream.close(): Unit \ IO;
            let FileOutputStream(s1) = s;
            close(s1)
        })

}
