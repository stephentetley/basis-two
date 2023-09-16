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
    use IOError.Generic

    use Basis.IO.FileInputStream
    use Basis.IO.FileInputStream.{FileInputStream}
    use Basis.IO.Path
    use Basis.IO.Path.{Path}
    use Basis.IO.File.{File}
    use Basis.IO.FileChannel
    use Basis.IO.FileChannel.{FileChannel}

    pub def new(path: Path): Result[IOError, FileInputStream] \ IO = 
        Result.mapErr(Generic, Basis.IO.Path.toFile(path)) >>= file ->
        IOError.tryCatch(_ -> {
            import new java.io.FileInputStream(##java.io.File): ##java.io.FileInputStream \ IO as newFileInputStream;
            let File(file1) = file;
            FileInputStream(newFileInputStream(file1))
        })


    pub def getChannel(s: FileInputStream): FileChannel \ IO = 
        import java.io.FileInputStream.getChannel(): ##java.nio.channels.FileChannel \ IO;
        let FileInputStream(s1) = s;
        FileChannel(getChannel(s1))

    pub def close!(s: FileInputStream): Result[IOError, Unit] \ IO = 
        IOError.tryCatch(_ -> {
            import java.io.FileInputStream.close(): Unit \ IO;
            let FileInputStream(s1) = s;
            close(s1)
        })


    pub def reset!(s: FileInputStream): Result[IOError, Unit] \ IO = 
        IOError.tryCatch(_ -> {
            import java.io.FileInputStream.close(): Unit \ IO;
            let FileInputStream(s1) = s;
            close(s1)
        })

    pub def readByte!(s: FileInputStream): Result[IOError, Int32] \ IO = 
        IOError.tryCatch(_ -> {
            import java.io.FileInputStream.read(): Int32 \ IO;
            let FileInputStream(s1) = s;
            read(s1)
        })

    // Read into arr...
    pub def readArray!(arr: Array[Int8, r], s: FileInputStream): Result[IOError, Int32] \ {IO, r} = 
        IOError.tryCatch(_ -> {
            import java.io.FileInputStream.read(Array[Int8, r]): Int32 \ {IO, r};
            let FileInputStream(s1) = s;
            read(s1, arr)
        })

    // Read into arr...
    pub def readArrayWith(offset: {offset = Int32}, length: {length = Int32}, arr: Array[Int8, r], s: FileInputStream): Result[IOError, Int32] \ {IO, r} = 
        IOError.tryCatch(_ -> {
            import java.io.FileInputStream.read(Array[Int8, r], Int32, Int32): Int32 \ {IO, r};
            let FileInputStream(s1) = s;
            read(s1, arr, offset.offset, length.length)
        })

    pub def readAllBytes(_: Region[r], s: FileInputStream): Result[IOError, Array[Int8, r]] \ {IO, r} = 
        IOError.tryCatch(_ -> {
            import java.io.FileInputStream.readAllBytes(): Array[Int8, r] \ {IO, r};
            let FileInputStream(s1) = s;
            readAllBytes(s1)
        })

    pub def readNBytes(_: Region[r], n: Int32, s: FileInputStream): Result[IOError, Array[Int8, r]] \ {IO, r} = 
        IOError.tryCatch(_ -> {
            import java.io.FileInputStream.readNBytes(Int32): Array[Int8, r] \ {IO, r};
            let FileInputStream(s1) = s;
            readNBytes(s1, n)
        })


    pub def skip!(n: Int64, s: FileInputStream): Result[IOError, Int64] \ IO = 
        IOError.tryCatch(_ -> {
            import java.io.FileInputStream.skip(Int64): Int64 \ IO;
            let FileInputStream(s1) = s;
            skip(s1, n)
        })

}
