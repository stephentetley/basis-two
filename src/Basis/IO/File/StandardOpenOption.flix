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


mod Basis.IO.File {

    ///
    /// Represents an StandardOpenOption.
    pub enum StandardOpenOption with Eq, Order, ToString, Hash {
        case Append
        case Create
        case CreateNew
        case DeleteOnClose
        case Dsync
        case Read
        case Sparse
        case Sync
        case TruncateExisting
        case Write
    }

}

mod Basis.IO.File.StandardOpenOption {

    use Basis.IO.File.OpenOption
    use Basis.IO.File.OpenOption.{OpenOption}


    pub def asOpenOption(o: StandardOpenOption): OpenOption = 
        let o1 = standardOpenOptionToJava(o);
        OpenOption(checked_cast(o1))


    pub def standardOpenOptionToJava(o: StandardOpenOption): ##java.nio.file.StandardOpenOption = 
        import static get java.nio.file.StandardOpenOption.APPEND: ##java.nio.file.StandardOpenOption \ {} as get_APPEND;
        import static get java.nio.file.StandardOpenOption.CREATE: ##java.nio.file.StandardOpenOption \ {} as get_CREATE;
        import static get java.nio.file.StandardOpenOption.CREATE_NEW: ##java.nio.file.StandardOpenOption \ {} as get_CREATE_NEW;
        import static get java.nio.file.StandardOpenOption.DELETE_ON_CLOSE: ##java.nio.file.StandardOpenOption \ {} as get_DELETE_ON_CLOSE;
        import static get java.nio.file.StandardOpenOption.DSYNC: ##java.nio.file.StandardOpenOption \ {} as get_DSYNC;
        import static get java.nio.file.StandardOpenOption.READ: ##java.nio.file.StandardOpenOption \ {} as get_READ;
        import static get java.nio.file.StandardOpenOption.SPARSE: ##java.nio.file.StandardOpenOption \ {} as get_SPARSE;
        import static get java.nio.file.StandardOpenOption.SYNC: ##java.nio.file.StandardOpenOption \ {} as get_SYNC;
        import static get java.nio.file.StandardOpenOption.TRUNCATE_EXISTING: ##java.nio.file.StandardOpenOption \ {} as get_TRUNCATE_EXISTING;
        import static get java.nio.file.StandardOpenOption.WRITE: ##java.nio.file.StandardOpenOption \ {} as get_WRITE;
        match o {
            case Append             => get_APPEND()
            case Create             => get_CREATE()
            case CreateNew          => get_CREATE_NEW()
            case DeleteOnClose      => get_DELETE_ON_CLOSE()
            case Dsync              => get_DSYNC()
            case Read               => get_READ()
            case Sparse             => get_SPARSE()
            case Sync               => get_SYNC()
            case TruncateExisting   => get_TRUNCATE_EXISTING()
            case Write              => get_WRITE()
        }

    /// Not an Enum in Java.
    def primEquals(x: ##java.nio.file.StandardOpenOption, y: ##java.nio.file.StandardOpenOption): Bool =
        import java.lang.Enum.equals(##java.lang.Object): Bool \ {};
        let x1 = checked_cast(x);
        let y1 = checked_cast(y);
        equals(x1, y1)

    pub def standardOpenOptionFromJava(o: ##java.nio.file.StandardOpenOption): StandardOpenOption = 
        import static get java.nio.file.StandardOpenOption.APPEND: ##java.nio.file.StandardOpenOption \ {} as get_APPEND;
        import static get java.nio.file.StandardOpenOption.CREATE: ##java.nio.file.StandardOpenOption \ {} as get_CREATE;
        import static get java.nio.file.StandardOpenOption.CREATE_NEW: ##java.nio.file.StandardOpenOption \ {} as get_CREATE_NEW;
        import static get java.nio.file.StandardOpenOption.DELETE_ON_CLOSE: ##java.nio.file.StandardOpenOption \ {} as get_DELETE_ON_CLOSE;
        import static get java.nio.file.StandardOpenOption.DSYNC: ##java.nio.file.StandardOpenOption \ {} as get_DSYNC;
        import static get java.nio.file.StandardOpenOption.READ: ##java.nio.file.StandardOpenOption \ {} as get_READ;
        import static get java.nio.file.StandardOpenOption.SPARSE: ##java.nio.file.StandardOpenOption \ {} as get_SPARSE;
        import static get java.nio.file.StandardOpenOption.SYNC: ##java.nio.file.StandardOpenOption \ {} as get_SYNC;
        import static get java.nio.file.StandardOpenOption.TRUNCATE_EXISTING: ##java.nio.file.StandardOpenOption \ {} as get_TRUNCATE_EXISTING;
        import static get java.nio.file.StandardOpenOption.WRITE: ##java.nio.file.StandardOpenOption \ {} as get_WRITE;
        match o {
            case n if primEquals(n, get_APPEND())               => Append
            case n if primEquals(n, get_CREATE())               => Create
            case n if primEquals(n, get_CREATE_NEW())           => CreateNew
            case n if primEquals(n, get_DELETE_ON_CLOSE())      => DeleteOnClose
            case n if primEquals(n, get_DSYNC())                => Dsync
            case n if primEquals(n, get_READ())                 => Read
            case n if primEquals(n, get_SPARSE())               => Sparse
            case n if primEquals(n, get_SYNC())                 => Sync
            case n if primEquals(n, get_TRUNCATE_EXISTING())    => TruncateExisting
            case n if primEquals(n, get_WRITE())                => Write
            case _                                              => bug!("standardOpenOptionFromJava")
        }
}
