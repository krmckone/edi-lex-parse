# frozen_string_literal: true

LEXER_FILE_EXAMPLES = {
  "204": [
    [
      [:SEGSTART, "ISA"],
      [:ELEMSEP, "*"], [:ELEM, "00"],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, "00"],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, "09"],
      [:ELEMSEP, "*"], [:ELEM, "005070479ff"],
      [:ELEMSEP, "*"], [:ELEM, "ZZ"],
      [:ELEMSEP, "*"], [:ELEM, "X0000X0"],
      [:ELEMSEP, "*"], [:ELEM, "931001"],
      [:ELEMSEP, "*"], [:ELEM, "1020"],
      [:ELEMSEP, "*"], [:ELEM, "U"],
      [:ELEMSEP, "*"], [:ELEM, "00401"],
      [:ELEMSEP, "*"], [:ELEM, "000952061"],
      [:ELEMSEP, "*"], [:ELEM, "0"],
      [:ELEMSEP, "*"], [:ELEM, "T"],
      [:ELEMSEP, "*"], [:ELEM, "^"],
      [:SEGEND, "~"],
      [:SEGSTART, "GS"],
      [:ELEMSEP, "*"], [:ELEM, "AA"],
      [:ELEMSEP, "*"], [:ELEM, "64GVCAJ68Y"],
      [:ELEMSEP, "*"], [:ELEM, "2L0CIJM03G"],
      [:ELEMSEP, "*"], [:ELEM, "20220920"],
      [:ELEMSEP, "*"], [:ELEM, "084151"],
      [:ELEMSEP, "*"], [:ELEM, "598951"],
      [:ELEMSEP, "*"], [:ELEM, "T"],
      [:ELEMSEP, "*"], [:ELEM, "004010"],
      [:SEGEND, "~"],
      [:SEGSTART, "ST"],
      [:ELEMSEP, "*"], [:ELEM, "204"],
      [:ELEMSEP, "*"], [:ELEM, "386417176"],
      [:SEGEND, "~"],
      [:SEGSTART, "B2"],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, "11"],
      [:SEGEND, "~"],
      [:SEGSTART, "B2A"],
      [:ELEMSEP, "*"], [:ELEM, "00"],
      [:SEGEND, "~"],
      [:SEGSTART, "MS3"],
      [:ELEMSEP, "*"], [:ELEM, "8651"],
      [:ELEMSEP, "*"], [:ELEM, "1"],
      [:SEGEND, "~"],
      [:SEGSTART, "PLD"],
      [:ELEMSEP, "*"], [:ELEM, "10"],
      [:SEGEND, "~"],
      [:SEGSTART, "LH6"],
      [:SEGEND, "~"],
      [:SEGSTART, "NTE"],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, "Try to bypass the SCSI sensor, maybe it will generate the 1080p card!"],
      [:SEGEND, "~"],
      [:SEGSTART, "N1"],
      [:ELEMSEP, "*"], [:ELEM, "01"],
      [:ELEMSEP, "*"], [:ELEM, "Valentina Santiago"],
      [:SEGEND, "~"],
      [:SEGSTART, "N3"],
      [:ELEMSEP, "*"], [:ELEM, "1338 Zboncak Center"],
      [:SEGEND, "~"],
      [:SEGSTART, "N7"],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, "381981"],
      [:SEGEND, "~"],
      [:SEGSTART, "N7B"],
      [:SEGEND, "~"],
      [:SEGSTART, "M7"],
      [:ELEMSEP, "*"], [:ELEM, "158707"],
      [:SEGEND, "~"],
      [:SEGSTART, "S5"],
      [:ELEMSEP, "*"], [:ELEM, "10"],
      [:ELEMSEP, "*"], [:ELEM, "AL"],
      [:SEGEND, "~"],
      [:SEGSTART, "G62"],
      [:ELEMSEP, "*"], [:ELEM, "01"],
      [:ELEMSEP, "*"], [:ELEM, "20220227"],
      [:SEGEND, "~"],
      [:SEGSTART, "AT8"],
      [:SEGEND, "~"],
      [:SEGSTART, "AT5"],
      [:SEGEND, "~"],
      [:SEGSTART, "PLD"],
      [:ELEMSEP, "*"], [:ELEM, "10"],
      [:SEGEND, "~"],
      [:SEGSTART, "NTE"],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, "If we override the bandwidth, we can get to the SMTP capacitor through the cross"],
      [:SEGEND, "~"],
      [:SEGSTART, "N1"],
      [:ELEMSEP, "*"], [:ELEM, "01"],
      [:ELEMSEP, "*"], [:ELEM, "Yaakv Allen"],
      [:SEGEND, "~"],
      [:SEGSTART, "N3"],
      [:ELEMSEP, "*"], [:ELEM, "907 Torphy Fords"],
      [:SEGEND, "~"],
      [:SEGSTART, "N4"],
      [:SEGEND, "~"],
      [:SEGSTART, "G61"],
      [:ELEMSEP, "*"], [:ELEM, "1A"],
      [:ELEMSEP, "*"], [:ELEM, "Hiroko Shimizu"],
      [:SEGEND, "~"],
      [:SEGSTART, "OID"],
      [:ELEMSEP, "*"], [:ELEM, "333591"],
      [:SEGEND, "~"],
      [:SEGSTART, "G62"],
      [:ELEMSEP, "*"], [:ELEM, "01"],
      [:ELEMSEP, "*"], [:ELEM, "20211230"],
      [:SEGEND, "~"],
      [:SEGSTART, "SE"],
      [:ELEMSEP, "*"], [:ELEM, "10"],
      [:ELEMSEP, "*"], [:ELEM, "604150077"],
      [:SEGEND, "~"],
      [:SEGSTART, "GE"],
      [:ELEMSEP, "*"], [:ELEM, "10"],
      [:ELEMSEP, "*"], [:ELEM, "598951"],
      [:SEGEND, "~"],
      [:SEGSTART, "IEA"],
      [:ELEMSEP, "*"], [:ELEM, "1"],
      [:ELEMSEP, "*"], [:ELEM, "000952061"],
      [:SEGEND, "~"]
    ]
  ]
}.freeze

PARSER_FILE_EXAMPLES = {
  "204": [
    [
      [
        ["00", 1],
        ["",   2],
        ["00", 3],
        ["",   4],
        ["09", 5],
        ["005070479ff", 6],
        ["ZZ", 7],
        ["X0000X0", 8],
        ["931001", 9],
        ["1020", 10],
        ["U", 11],
        ["00401", 12],
        ["000952061", 13],
        ["0", 14],
        ["T", 15],
        ["^", 16]
      ],
      [
        ["AA", 1],
        ["64GVCAJ68Y", 2],
        ["2L0CIJM03G", 3],
        ["20220920", 4],
        ["084151", 5],
        ["598951", 6],
        ["T", 7],
        ["004010", 8]
      ],
      [
        ["204", 1],
        ["386417176", 2]
      ],
      [
        ["", 1],
        ["", 2],
        ["", 3],
        ["", 4],
        ["", 5],
        ["11", 6]
      ],
      [
        ["00", 1]
      ],
      [
        ["8651", 1],
        ["1", 2]
      ],
      [
        ["10", 1]
      ],
      [],
      [
        ["", 1],
        ["Try to bypass the SCSI sensor, maybe it will generate the 1080p card!", 2]
      ],
      [
        ["01", 1],
        ["Valentina Santiago", 2]
      ],
      [
        ["1338 Zboncak Center", 1]
      ],
      [
        ["", 1],
        ["381981", 2]
      ],
      [],
      [
        ["158707", 1]
      ],
      [
        ["10", 1],
        ["AL", 2]
      ],
      [
        ["01", 1],
        ["20220227", 2]
      ],
      [],
      [],
      [
        ["10", 1]
      ],
      [
        ["", 1],
        ["If we override the bandwidth, we can get to the SMTP capacitor through the cross", 2]
      ],
      [
        ["01", 1],
        ["Yaakv Allen", 2]
      ],
      [
        ["907 Torphy Fords", 1]
      ],
      [],
      [
        ["1A", 1],
        ["Hiroko Shimizu", 2]
      ],
      [
        ["333591", 1]
      ],
      [
        ["01", 1],
        ["20211230", 2]
      ],
      [
        ["10", 1],
        ["604150077", 2]
      ],
      [
        ["10", 1],
        ["598951", 2]
      ],
      [
        ["1", 1],
        ["000952061", 2]
      ]
    ]
  ]
}
