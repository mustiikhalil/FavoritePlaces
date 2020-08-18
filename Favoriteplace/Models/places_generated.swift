// automatically generated by the FlatBuffers compiler, do not modify
// swiftlint:disable all

import FlatBuffers

public enum Category: Int8, Enum { 
    public typealias T = Int8
    public static var byteSize: Int { return MemoryLayout<Int8>.size }
    public var value: Int8 { return self.rawValue }
    case featured = 0
    case lakes = 1
    case rivers = 2
    

    public static var max: Category { return .rivers }
    public static var min: Category { return .featured }
}

public struct Coordinates: Readable {

    static func validateVersion() { FlatBuffersVersion_1_12_0() }
    public var __buffer: ByteBuffer! { return _accessor.bb }
    private var _accessor: Struct

    public static var size = 16
    public static var alignment = 8
    public init(_ bb: ByteBuffer, o: Int32) { _accessor = Struct(bb: bb, position: o) }

    public var longitude: Double { return _accessor.readBuffer(of: Double.self, at: 0) }
    public var latitude: Double { return _accessor.readBuffer(of: Double.self, at: 8) }
}

extension Coordinates {
    public static func createCoordinates(longitude: Double = 0.0, latitude: Double = 0.0) -> UnsafeMutableRawPointer {
        let memory = UnsafeMutableRawPointer.allocate(byteCount: Coordinates.size, alignment: Coordinates.alignment)
        memory.initializeMemory(as: UInt8.self, repeating: 0, count: Coordinates.size)
        memory.storeBytes(of: longitude, toByteOffset: 0, as: Double.self)
        memory.storeBytes(of: latitude, toByteOffset: 8, as: Double.self)
        return memory
    }

}

public struct Place: FlatBufferObject {

    static func validateVersion() { FlatBuffersVersion_1_12_0() }
    public var __buffer: ByteBuffer! { return _accessor.bb }
    private var _accessor: Table

    public static func getRootAsPlace(bb: ByteBuffer) -> Place { return Place(Table(bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))) }

    private init(_ t: Table) { _accessor = t }
    public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

    enum VTOFFSET: VOffset {
        case id = 4
        case name = 6
        case park = 8
        case coordinates = 10
        case state = 12
        case city = 14
        case category = 16
        case imageName = 18
        case isFavorite = 20
        var v: Int32 { Int32(self.rawValue) }
        var p: VOffset { self.rawValue }
    }

    public var id: Int32 { let o = _accessor.offset(VTOFFSET.id.v); return o == 0 ? 0 : _accessor.readBuffer(of: Int32.self, at: o) }
    public var name: String! { let o = _accessor.offset(VTOFFSET.name.v); return _accessor.string(at: o) }
    public var nameSegmentArray: [UInt8]! { return _accessor.getVector(at: VTOFFSET.name.v) }
    public var park: String! { let o = _accessor.offset(VTOFFSET.park.v); return _accessor.string(at: o) }
    public var parkSegmentArray: [UInt8]! { return _accessor.getVector(at: VTOFFSET.park.v) }
    public var coordinates: Coordinates? { let o = _accessor.offset(VTOFFSET.coordinates.v); return o == 0 ? nil : Coordinates(_accessor.bb, o: o + _accessor.postion) }
    public var state: String! { let o = _accessor.offset(VTOFFSET.state.v); return _accessor.string(at: o) }
    public var stateSegmentArray: [UInt8]! { return _accessor.getVector(at: VTOFFSET.state.v) }
    public var city: String! { let o = _accessor.offset(VTOFFSET.city.v); return _accessor.string(at: o) }
    public var citySegmentArray: [UInt8]! { return _accessor.getVector(at: VTOFFSET.city.v) }
    public var category: Category { let o = _accessor.offset(VTOFFSET.category.v); return o == 0 ? .featured : Category(rawValue: _accessor.readBuffer(of: Int8.self, at: o)) ?? .featured }
    public var imageName: String! { let o = _accessor.offset(VTOFFSET.imageName.v); return _accessor.string(at: o) }
    public var imageNameSegmentArray: [UInt8]! { return _accessor.getVector(at: VTOFFSET.imageName.v) }
    public var isFavorite: Bool { let o = _accessor.offset(VTOFFSET.isFavorite.v); return o == 0 ? false : 0 != _accessor.readBuffer(of: Byte.self, at: o) }
    public static func startPlace(_ fbb: inout FlatBufferBuilder) -> UOffset { fbb.startTable(with: 9) }
    public static func add(id: Int32, _ fbb: inout FlatBufferBuilder) { fbb.add(element: id, def: 0, at: VTOFFSET.id.p) }
    public static func add(name: Offset<String>, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: name, at: VTOFFSET.name.p)  }
    public static func add(park: Offset<String>, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: park, at: VTOFFSET.park.p)  }
    public static func add(coordinates: UnsafeMutableRawPointer?, _ fbb: inout FlatBufferBuilder) { guard let coordinates = coordinates else { return }; fbb.create(struct: coordinates, type: Coordinates.self); fbb.add(structOffset: VTOFFSET.coordinates.p) }
    public static func add(state: Offset<String>, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: state, at: VTOFFSET.state.p)  }
    public static func add(city: Offset<String>, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: city, at: VTOFFSET.city.p)  }
    public static func add(category: Category, _ fbb: inout FlatBufferBuilder) { fbb.add(element: category.rawValue, def: 0, at: VTOFFSET.category.p) }
    public static func add(imageName: Offset<String>, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: imageName, at: VTOFFSET.imageName.p)  }
    public static func add(isFavorite: Bool, _ fbb: inout FlatBufferBuilder) { fbb.add(element: isFavorite, def: false,
     at: VTOFFSET.isFavorite.p) }
    public static func endPlace(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset<UOffset> { let end = Offset<UOffset>(offset: fbb.endTable(at: start)); fbb.require(table: end, fields: [6, 8, 12, 14, 18]); return end }
    public static func createPlace(
        _ fbb: inout FlatBufferBuilder,
        id: Int32 = 0,
        offsetOfName name: Offset<String> = Offset(),
        offsetOfPark park: Offset<String> = Offset(),
        structOfCoordinates coordinates: UnsafeMutableRawPointer? = nil,
        offsetOfState state: Offset<String> = Offset(),
        offsetOfCity city: Offset<String> = Offset(),
        category: Category = .featured,
        offsetOfImageName imageName: Offset<String> = Offset(),
        isFavorite: Bool = false
    ) -> Offset<UOffset> {
        let __start = Place.startPlace(&fbb)
        Place.add(id: id, &fbb)
        Place.add(name: name, &fbb)
        Place.add(park: park, &fbb)
        Place.add(coordinates: coordinates, &fbb)
        Place.add(state: state, &fbb)
        Place.add(city: city, &fbb)
        Place.add(category: category, &fbb)
        Place.add(imageName: imageName, &fbb)
        Place.add(isFavorite: isFavorite, &fbb)
        return Place.endPlace(&fbb, start: __start)
    }
}

public struct Places: FlatBufferObject {

    static func validateVersion() { FlatBuffersVersion_1_12_0() }
    public var __buffer: ByteBuffer! { return _accessor.bb }
    private var _accessor: Table

    public static func getRootAsPlaces(bb: ByteBuffer) -> Places { return Places(Table(bb: bb, position: Int32(bb.read(def: UOffset.self, position: bb.reader)) + Int32(bb.reader))) }

    private init(_ t: Table) { _accessor = t }
    public init(_ bb: ByteBuffer, o: Int32) { _accessor = Table(bb: bb, position: o) }

    enum VTOFFSET: VOffset {
        case data = 4
        var v: Int32 { Int32(self.rawValue) }
        var p: VOffset { self.rawValue }
    }

    public var dataCount: Int32 { let o = _accessor.offset(VTOFFSET.data.v); return o == 0 ? 0 : _accessor.vector(count: o) }
    public func data(at index: Int32) -> Place? { let o = _accessor.offset(VTOFFSET.data.v); return o == 0 ? nil : Place(_accessor.bb, o: _accessor.indirect(_accessor.vector(at: o) + index * 4)) }
    public static func startPlaces(_ fbb: inout FlatBufferBuilder) -> UOffset { fbb.startTable(with: 1) }
    public static func addVectorOf(data: Offset<UOffset>, _ fbb: inout FlatBufferBuilder) { fbb.add(offset: data, at: VTOFFSET.data.p)  }
    public static func endPlaces(_ fbb: inout FlatBufferBuilder, start: UOffset) -> Offset<UOffset> { let end = Offset<UOffset>(offset: fbb.endTable(at: start)); return end }
    public static func createPlaces(
        _ fbb: inout FlatBufferBuilder,
        vectorOfData data: Offset<UOffset> = Offset()
    ) -> Offset<UOffset> {
        let __start = Places.startPlaces(&fbb)
        Places.addVectorOf(data: data, &fbb)
        return Places.endPlaces(&fbb, start: __start)
    }
}

