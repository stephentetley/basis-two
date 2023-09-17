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
    /// Represents an StandardCopyOption.
    pub enum StandardCopyOption with Eq, Order, ToString, Hash {
        case AtomicMove
        case CopyAttributes
        case ReplaceExisting
    }

}

mod Basis.IO.File.StandardCopyOption {

    use Basis.IO.File.CopyOption
    use Basis.IO.File.CopyOption.{CopyOption}


    pub def asCopyOption(o: StandardCopyOption): CopyOption = 
        let o1 = standardCopyOptionToJava(o);
        CopyOption(checked_cast(o1))


    pub def standardCopyOptionToJava(o: StandardCopyOption): ##java.nio.file.StandardCopyOption = 
        import static get java.nio.file.StandardCopyOption.ATOMIC_MOVE: ##java.nio.file.StandardCopyOption \ {} as get_ATOMIC_MOVE;
        import static get java.nio.file.StandardCopyOption.COPY_ATTRIBUTES: ##java.nio.file.StandardCopyOption \ {} as get_COPY_ATTRIBUTES;
        import static get java.nio.file.StandardCopyOption.REPLACE_EXISTING: ##java.nio.file.StandardCopyOption \ {} as get_REPLACE_EXISTING;
        match o {
            case AtomicMove         => get_ATOMIC_MOVE()
            case CopyAttributes     => get_COPY_ATTRIBUTES()
            case ReplaceExisting    => get_REPLACE_EXISTING()
        }

    /// Not an Enum in Java.
    def primEquals(x: ##java.nio.file.StandardCopyOption, y: ##java.nio.file.StandardCopyOption): Bool =
        import java.lang.Enum.equals(##java.lang.Object): Bool \ {};
        let x1 = checked_cast(x);
        let y1 = checked_cast(y);
        equals(x1, y1)

    pub def standardCopyOptionFromJava(o: ##java.nio.file.StandardCopyOption): StandardCopyOption = 
        import static get java.nio.file.StandardCopyOption.ATOMIC_MOVE: ##java.nio.file.StandardCopyOption \ {} as get_ATOMIC_MOVE;
        import static get java.nio.file.StandardCopyOption.COPY_ATTRIBUTES: ##java.nio.file.StandardCopyOption \ {} as get_COPY_ATTRIBUTES;
        import static get java.nio.file.StandardCopyOption.REPLACE_EXISTING: ##java.nio.file.StandardCopyOption \ {} as get_REPLACE_EXISTING;
        match o {
            case n if primEquals(n, get_ATOMIC_MOVE())          => AtomicMove
            case n if primEquals(n, get_COPY_ATTRIBUTES())      => CopyAttributes
            case n if primEquals(n, get_REPLACE_EXISTING())     => ReplaceExisting
            case _                                              => bug!("standardCopyOptionFromJava")
        }
}