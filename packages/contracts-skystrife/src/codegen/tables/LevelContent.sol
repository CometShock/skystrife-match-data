// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

// Import user types
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { PackedCounter } from "@latticexyz/store/src/PackedCounter.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("LevelContent")))
);
ResourceId constant LevelContentTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0020010220000000000000000000000000000000000000000000000000000000
);

library LevelContent {
  /**
   * @notice Get the table values' field layout.
   * @return _fieldLayout The field layout for the table.
   */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /**
   * @notice Get the table's key schema.
   * @return _keySchema The key schema for the table.
   */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](3);
    _keySchema[0] = SchemaType.BYTES32;
    _keySchema[1] = SchemaType.UINT256;
    _keySchema[2] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](3);
    _valueSchema[0] = SchemaType.BYTES32;
    _valueSchema[1] = SchemaType.BYTES;
    _valueSchema[2] = SchemaType.BYTES;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](3);
    keyNames[0] = "levelId";
    keyNames[1] = "index";
    keyNames[2] = "tableId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](3);
    fieldNames[0] = "encodedLengths";
    fieldNames[1] = "staticData";
    fieldNames[2] = "dynamicData";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get encodedLengths.
   */
  function getEncodedLengths(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId
  ) internal view returns (PackedCounter encodedLengths) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return PackedCounter.wrap(bytes32(_blob));
  }

  /**
   * @notice Get encodedLengths.
   */
  function _getEncodedLengths(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId
  ) internal view returns (PackedCounter encodedLengths) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return PackedCounter.wrap(bytes32(_blob));
  }

  /**
   * @notice Set encodedLengths.
   */
  function setEncodedLengths(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    PackedCounter encodedLengths
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreSwitch.setStaticField(
      _tableId,
      _keyTuple,
      0,
      abi.encodePacked(PackedCounter.unwrap(encodedLengths)),
      _fieldLayout
    );
  }

  /**
   * @notice Set encodedLengths.
   */
  function _setEncodedLengths(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    PackedCounter encodedLengths
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreCore.setStaticField(
      _tableId,
      _keyTuple,
      0,
      abi.encodePacked(PackedCounter.unwrap(encodedLengths)),
      _fieldLayout
    );
  }

  /**
   * @notice Get staticData.
   */
  function getStaticData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId
  ) internal view returns (bytes memory staticData) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (bytes(_blob));
  }

  /**
   * @notice Get staticData.
   */
  function _getStaticData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId
  ) internal view returns (bytes memory staticData) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (bytes(_blob));
  }

  /**
   * @notice Set staticData.
   */
  function setStaticData(bytes32 levelId, uint256 index, ResourceId tableId, bytes memory staticData) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, bytes((staticData)));
  }

  /**
   * @notice Set staticData.
   */
  function _setStaticData(bytes32 levelId, uint256 index, ResourceId tableId, bytes memory staticData) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, bytes((staticData)));
  }

  /**
   * @notice Get the length of staticData.
   */
  function lengthStaticData(bytes32 levelId, uint256 index, ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get the length of staticData.
   */
  function _lengthStaticData(bytes32 levelId, uint256 index, ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of staticData.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemStaticData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    uint256 _index
  ) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /**
   * @notice Get an item of staticData.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemStaticData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    uint256 _index
  ) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /**
   * @notice Push a slice to staticData.
   */
  function pushStaticData(bytes32 levelId, uint256 index, ResourceId tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /**
   * @notice Push a slice to staticData.
   */
  function _pushStaticData(bytes32 levelId, uint256 index, ResourceId tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /**
   * @notice Pop a slice from staticData.
   */
  function popStaticData(bytes32 levelId, uint256 index, ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Pop a slice from staticData.
   */
  function _popStaticData(bytes32 levelId, uint256 index, ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 1);
  }

  /**
   * @notice Update a slice of staticData at `_index`.
   */
  function updateStaticData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    uint256 _index,
    bytes memory _slice
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of staticData at `_index`.
   */
  function _updateStaticData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    uint256 _index,
    bytes memory _slice
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get dynamicData.
   */
  function getDynamicData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId
  ) internal view returns (bytes memory dynamicData) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 1);
    return (bytes(_blob));
  }

  /**
   * @notice Get dynamicData.
   */
  function _getDynamicData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId
  ) internal view returns (bytes memory dynamicData) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 1);
    return (bytes(_blob));
  }

  /**
   * @notice Set dynamicData.
   */
  function setDynamicData(bytes32 levelId, uint256 index, ResourceId tableId, bytes memory dynamicData) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 1, bytes((dynamicData)));
  }

  /**
   * @notice Set dynamicData.
   */
  function _setDynamicData(bytes32 levelId, uint256 index, ResourceId tableId, bytes memory dynamicData) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreCore.setDynamicField(_tableId, _keyTuple, 1, bytes((dynamicData)));
  }

  /**
   * @notice Get the length of dynamicData.
   */
  function lengthDynamicData(bytes32 levelId, uint256 index, ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get the length of dynamicData.
   */
  function _lengthDynamicData(bytes32 levelId, uint256 index, ResourceId tableId) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 1);
    unchecked {
      return _byteLength / 1;
    }
  }

  /**
   * @notice Get an item of dynamicData.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemDynamicData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    uint256 _index
  ) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /**
   * @notice Get an item of dynamicData.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemDynamicData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    uint256 _index
  ) internal view returns (bytes memory) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 1, _index * 1, (_index + 1) * 1);
      return (bytes(_blob));
    }
  }

  /**
   * @notice Push a slice to dynamicData.
   */
  function pushDynamicData(bytes32 levelId, uint256 index, ResourceId tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /**
   * @notice Push a slice to dynamicData.
   */
  function _pushDynamicData(bytes32 levelId, uint256 index, ResourceId tableId, bytes memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /**
   * @notice Pop a slice from dynamicData.
   */
  function popDynamicData(bytes32 levelId, uint256 index, ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 1, 1);
  }

  /**
   * @notice Pop a slice from dynamicData.
   */
  function _popDynamicData(bytes32 levelId, uint256 index, ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 1, 1);
  }

  /**
   * @notice Update a slice of dynamicData at `_index`.
   */
  function updateDynamicData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    uint256 _index,
    bytes memory _slice
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update a slice of dynamicData at `_index`.
   */
  function _updateDynamicData(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    uint256 _index,
    bytes memory _slice
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    unchecked {
      bytes memory _encoded = bytes((_slice));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 1, uint40(_index * 1), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Get the full data.
   */
  function get(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId
  ) internal view returns (PackedCounter encodedLengths, bytes memory staticData, bytes memory dynamicData) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId
  ) internal view returns (PackedCounter encodedLengths, bytes memory staticData, bytes memory dynamicData) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    PackedCounter encodedLengths,
    bytes memory staticData,
    bytes memory dynamicData
  ) internal {
    bytes memory _staticData = encodeStatic(encodedLengths);

    PackedCounter _encodedLengths = encodeLengths(staticData, dynamicData);
    bytes memory _dynamicData = encodeDynamic(staticData, dynamicData);

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    bytes32 levelId,
    uint256 index,
    ResourceId tableId,
    PackedCounter encodedLengths,
    bytes memory staticData,
    bytes memory dynamicData
  ) internal {
    bytes memory _staticData = encodeStatic(encodedLengths);

    PackedCounter _encodedLengths = encodeLengths(staticData, dynamicData);
    bytes memory _dynamicData = encodeDynamic(staticData, dynamicData);

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(bytes memory _blob) internal pure returns (PackedCounter encodedLengths) {
    encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 0));
  }

  /**
   * @notice Decode the tightly packed blob of dynamic data using the encoded lengths.
   */
  function decodeDynamic(
    PackedCounter _encodedLengths,
    bytes memory _blob
  ) internal pure returns (bytes memory staticData, bytes memory dynamicData) {
    uint256 _start;
    uint256 _end;
    unchecked {
      _end = _encodedLengths.atIndex(0);
    }
    staticData = (bytes(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

    _start = _end;
    unchecked {
      _end += _encodedLengths.atIndex(1);
    }
    dynamicData = (bytes(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   * @param _encodedLengths Encoded lengths of dynamic fields.
   * @param _dynamicData Tightly packed dynamic fields.
   */
  function decode(
    bytes memory _staticData,
    PackedCounter _encodedLengths,
    bytes memory _dynamicData
  ) internal pure returns (PackedCounter encodedLengths, bytes memory staticData, bytes memory dynamicData) {
    (encodedLengths) = decodeStatic(_staticData);

    (staticData, dynamicData) = decodeDynamic(_encodedLengths, _dynamicData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(bytes32 levelId, uint256 index, ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(bytes32 levelId, uint256 index, ResourceId tableId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(PackedCounter encodedLengths) internal pure returns (bytes memory) {
    return abi.encodePacked(encodedLengths);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(
    bytes memory staticData,
    bytes memory dynamicData
  ) internal pure returns (PackedCounter _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(bytes(staticData).length, bytes(dynamicData).length);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(bytes memory staticData, bytes memory dynamicData) internal pure returns (bytes memory) {
    return abi.encodePacked(bytes((staticData)), bytes((dynamicData)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dyanmic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    PackedCounter encodedLengths,
    bytes memory staticData,
    bytes memory dynamicData
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(encodedLengths);

    PackedCounter _encodedLengths = encodeLengths(staticData, dynamicData);
    bytes memory _dynamicData = encodeDynamic(staticData, dynamicData);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(bytes32 levelId, uint256 index, ResourceId tableId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = levelId;
    _keyTuple[1] = bytes32(uint256(index));
    _keyTuple[2] = ResourceId.unwrap(tableId);

    return _keyTuple;
  }
}
