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
    /// Represents an OutputStreamWriter.
    ///
    pub enum OutputStreamWriter[_: Region](##java.io.OutputStreamWriter)

}

mod Basis.IO.OutputStreamWriter {


    use Basis.IO.OutputStreamWriter
    use Basis.IO.OutputStreamWriter.{OutputStreamWriter}
    use Basis.IO.OutputStream
    use Basis.IO.OutputStream.{OutputStream}
    use Basis.IO.Writer
    use Basis.IO.Writer.{Writer}
    use Charset.{Charset}

    pub def new(s: OutputStream[r]): OutputStreamWriter[r] \ r = 
        import new java.io.OutputStreamWriter(##java.io.OutputStream): ##java.io.OutputStreamWriter \ r as newOutputStreamWriter;
        let OutputStream(s1) = s;
        OutputStreamWriter(newOutputStreamWriter(s1))

    pub def newWithCharset(cs: Charset, s: OutputStream[r]): OutputStreamWriter[r] \ r = 
        import new java.io.OutputStreamWriter(##java.io.OutputStream, ##java.nio.charset.Charset): ##java.io.OutputStreamWriter \ r as newOutputStreamWriter;
        let OutputStream(s1) = s;
        let Charset(cs1) = cs;
        OutputStreamWriter(newOutputStreamWriter(s1, cs1))

    pub def asWriter(w: OutputStreamWriter[r]): Writer[r] \ r = 
        let OutputStreamWriter(w1) = w;
        checked_ecast(Writer(checked_cast(w1)))
    

    pub def close!(w: OutputStreamWriter[r]): Result[String, Unit] \ r = 
        Result.tryCatch(_ -> {
            import java.io.OutputStreamWriter.close(): Unit \ r;
            let OutputStreamWriter(w1) = w;
            close(w1)
        })

    pub def writeChar!(b: Int32, w: OutputStreamWriter[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.io.OutputStreamWriter.write(Int32): Unit \ r;
            let OutputStreamWriter(w1) = w;
            write(w1, b)
        })

    pub def writeArray!(buf: Array[Char, r1], 
                        w: OutputStreamWriter[r]): Result[String, Unit] \ {r, r1} =
        Result.tryCatch(_ -> {
            import java.io.OutputStreamWriter.write(Array[Char, r1]): Unit \ {r, r1};
            let OutputStreamWriter(w1) = w;
            write(w1, buf)
        })

    pub def writeString!(destOffset: {destOffset = Int32}, 
                            length: {length = Int32}, 
                            str: String, 
                            w: OutputStreamWriter[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.io.OutputStreamWriter.write(String, Int32, Int32): Unit \ r;
            let OutputStreamWriter(w1) = w;
            write(w1, str, destOffset.destOffset, length.length)
        })

}
