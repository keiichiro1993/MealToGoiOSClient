// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
class JsonPaymentIntent: Codable {
    let id, object: String
    let amount, amountCapturable, amountReceived: Int
    let application, applicationFeeAmount, canceledAt, cancellationReason: JSONNull?
    let captureMethod: String
    let charges: Charges
    let clientSecret, confirmationMethod: String
    let created: Int
    let currency, customer: String
    let welcomeDescription, invoice, lastPaymentError: JSONNull?
    let livemode: Bool
    let metadata: Metadata
    let nextAction, onBehalfOf, paymentMethod: JSONNull?
    let paymentMethodOptions: PaymentMethodOptions
    let paymentMethodTypes: [String]
    let receiptEmail, review, setupFutureUsage, shipping: JSONNull?
    let source, statementDescriptor, statementDescriptorSuffix: JSONNull?
    let status: String
    let transferData, transferGroup: JSONNull?

    enum CodingKeys: String, CodingKey {
        case id, object, amount
        case amountCapturable = "amount_capturable"
        case amountReceived = "amount_received"
        case application
        case applicationFeeAmount = "application_fee_amount"
        case canceledAt = "canceled_at"
        case cancellationReason = "cancellation_reason"
        case captureMethod = "capture_method"
        case charges
        case clientSecret = "client_secret"
        case confirmationMethod = "confirmation_method"
        case created, currency, customer
        case welcomeDescription = "description"
        case invoice
        case lastPaymentError = "last_payment_error"
        case livemode, metadata
        case nextAction = "next_action"
        case onBehalfOf = "on_behalf_of"
        case paymentMethod = "payment_method"
        case paymentMethodOptions = "payment_method_options"
        case paymentMethodTypes = "payment_method_types"
        case receiptEmail = "receipt_email"
        case review
        case setupFutureUsage = "setup_future_usage"
        case shipping, source
        case statementDescriptor = "statement_descriptor"
        case statementDescriptorSuffix = "statement_descriptor_suffix"
        case status
        case transferData = "transfer_data"
        case transferGroup = "transfer_group"
    }

    init(id: String, object: String, amount: Int, amountCapturable: Int, amountReceived: Int, application: JSONNull?, applicationFeeAmount: JSONNull?, canceledAt: JSONNull?, cancellationReason: JSONNull?, captureMethod: String, charges: Charges, clientSecret: String, confirmationMethod: String, created: Int, currency: String, customer: String, welcomeDescription: JSONNull?, invoice: JSONNull?, lastPaymentError: JSONNull?, livemode: Bool, metadata: Metadata, nextAction: JSONNull?, onBehalfOf: JSONNull?, paymentMethod: JSONNull?, paymentMethodOptions: PaymentMethodOptions, paymentMethodTypes: [String], receiptEmail: JSONNull?, review: JSONNull?, setupFutureUsage: JSONNull?, shipping: JSONNull?, source: JSONNull?, statementDescriptor: JSONNull?, statementDescriptorSuffix: JSONNull?, status: String, transferData: JSONNull?, transferGroup: JSONNull?) {
        self.id = id
        self.object = object
        self.amount = amount
        self.amountCapturable = amountCapturable
        self.amountReceived = amountReceived
        self.application = application
        self.applicationFeeAmount = applicationFeeAmount
        self.canceledAt = canceledAt
        self.cancellationReason = cancellationReason
        self.captureMethod = captureMethod
        self.charges = charges
        self.clientSecret = clientSecret
        self.confirmationMethod = confirmationMethod
        self.created = created
        self.currency = currency
        self.customer = customer
        self.welcomeDescription = welcomeDescription
        self.invoice = invoice
        self.lastPaymentError = lastPaymentError
        self.livemode = livemode
        self.metadata = metadata
        self.nextAction = nextAction
        self.onBehalfOf = onBehalfOf
        self.paymentMethod = paymentMethod
        self.paymentMethodOptions = paymentMethodOptions
        self.paymentMethodTypes = paymentMethodTypes
        self.receiptEmail = receiptEmail
        self.review = review
        self.setupFutureUsage = setupFutureUsage
        self.shipping = shipping
        self.source = source
        self.statementDescriptor = statementDescriptor
        self.statementDescriptorSuffix = statementDescriptorSuffix
        self.status = status
        self.transferData = transferData
        self.transferGroup = transferGroup
    }
}

// MARK: - Charges
class Charges: Codable {
    let object: String
    let data: [JSONAny]
    let hasMore: Bool
    let totalCount: Int
    let url: String

    enum CodingKeys: String, CodingKey {
        case object, data
        case hasMore = "has_more"
        case totalCount = "total_count"
        case url
    }

    init(object: String, data: [JSONAny], hasMore: Bool, totalCount: Int, url: String) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.totalCount = totalCount
        self.url = url
    }
}

// MARK: - Metadata
class Metadata: Codable {

    init() {
    }
}

// MARK: - PaymentMethodOptions
class PaymentMethodOptions: Codable {
    let card: Card

    init(card: Card) {
        self.card = card
    }
}

// MARK: - Card
class Card: Codable {
    let installments, network: JSONNull?
    let requestThreeDSecure: String

    enum CodingKeys: String, CodingKey {
        case installments, network
        case requestThreeDSecure = "request_three_d_secure"
    }

    init(installments: JSONNull?, network: JSONNull?, requestThreeDSecure: String) {
        self.installments = installments
        self.network = network
        self.requestThreeDSecure = requestThreeDSecure
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
