# frozen_string_literal: true

LEXER_SEGMENT_EXAMPLES = {
  ISA: [
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
      [:SEGEND, "~"]
    ]
  ],
  GS: [
    [
      [:SEGSTART, "GS"],
      [:ELEMSEP, "*"], [:ELEM, "AA"],
      [:ELEMSEP, "*"], [:ELEM, "64GVCAJ68Y"],
      [:ELEMSEP, "*"], [:ELEM, "2L0CIJM03G"],
      [:ELEMSEP, "*"], [:ELEM, "20220920"],
      [:ELEMSEP, "*"], [:ELEM, "084151"],
      [:ELEMSEP, "*"], [:ELEM, "598951"],
      [:ELEMSEP, "*"], [:ELEM, "T"],
      [:ELEMSEP, "*"], [:ELEM, "004010"],
      [:SEGEND, "~"]
    ]
  ],
  ST: [
    [
      [:SEGSTART, "ST"],
      [:ELEMSEP, "*"], [:ELEM, "204"],
      [:ELEMSEP, "*"], [:ELEM, "386417176"],
      [:SEGEND, "~"]
    ]
  ],
  B2: [
    [
      [:SEGSTART, "B2"],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, "11"],
      [:SEGEND, "~"]
    ]
  ],
  B2A: [
    [
      [:SEGSTART, "B2A"],
      [:ELEMSEP, "*"], [:ELEM, "00"],
      [:SEGEND, "~"]
    ]
  ],
  MS3: [
    [
      [:SEGSTART, "MS3"],
      [:ELEMSEP, "*"], [:ELEM, "8651"],
      [:ELEMSEP, "*"], [:ELEM, "1"],
      [:SEGEND, "~"]
    ]
  ],
  PLD: [
    [
      [:SEGSTART, "PLD"],
      [:ELEMSEP, "*"], [:ELEM, "10"],
      [:SEGEND, "~"]
    ]
  ],
  LH6: [
    [
      [:SEGSTART, "LH6"],
      [:SEGEND, "~"]
    ]
  ],
  NTE: [
    [
      [:SEGSTART, "NTE"],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, "Try to bypass the SCSI sensor, maybe it will generate the 1080p card!"],
      [:SEGEND, "~"]
    ],
    [
      [:SEGSTART, "NTE"],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, "If we override the bandwidth, we can get to the SMTP capacitor through the cross"],
      [:SEGEND, "~"]
    ]
  ],
  N1: [
    [
      [:SEGSTART, "N1"],
      [:ELEMSEP, "*"], [:ELEM, "01"],
      [:ELEMSEP, "*"], [:ELEM, "Valentina Santiago"],
      [:SEGEND, "~"]
    ],
    [
      [:SEGSTART, "N1"],
      [:ELEMSEP, "*"], [:ELEM, "01"],
      [:ELEMSEP, "*"], [:ELEM, "Yaakv Allen"],
      [:SEGEND, "~"]
    ]
  ],
  N3: [
    [
      [:SEGSTART, "N3"],
      [:ELEMSEP, "*"], [:ELEM, "1338 Zboncak Center"],
      [:SEGEND, "~"]
    ],
    [
      [:SEGSTART, "N3"],
      [:ELEMSEP, "*"], [:ELEM, "907 Torphy Fords"],
      [:SEGEND, "~"]
    ]
  ],
  N7: [
    [
      [:SEGSTART, "N7"],
      [:ELEMSEP, "*"], [:ELEM, ""],
      [:ELEMSEP, "*"], [:ELEM, "381981"],
      [:SEGEND, "~"]
    ]
  ],
  N7B: [
    [
      [:SEGSTART, "N7B"],
      [:SEGEND, "~"]
    ]
  ],
  M7: [
    [
      [:SEGSTART, "M7"],
      [:ELEMSEP, "*"], [:ELEM, "158707"],
      [:SEGEND, "~"]
    ]
  ],
  S5: [
    [
      [:SEGSTART, "S5"],
      [:ELEMSEP, "*"], [:ELEM, "10"],
      [:ELEMSEP, "*"], [:ELEM, "AL"],
      [:SEGEND, "~"]
    ]
  ],
  G62: [
    [
      [:SEGSTART, "G62"],
      [:ELEMSEP, "*"], [:ELEM, "01"],
      [:ELEMSEP, "*"], [:ELEM, "20220227"],
      [:SEGEND, "~"]
    ],
    [
      [:SEGSTART, "G62"],
      [:ELEMSEP, "*"], [:ELEM, "01"],
      [:ELEMSEP, "*"], [:ELEM, "20211230"],
      [:SEGEND, "~"]
    ]
  ],
  AT8: [
    [
      [:SEGSTART, "AT8"],
      [:SEGEND, "~"]
    ]
  ],
  AT5: [
    [
      [:SEGSTART, "AT5"],
      [:SEGEND, "~"]
    ]
  ],
  N4: [
    [
      [:SEGSTART, "N4"],
      [:SEGEND, "~"]
    ]
  ],
  G61: [
    [
      [:SEGSTART, "G61"],
      [:ELEMSEP, "*"], [:ELEM, "1A"],
      [:ELEMSEP, "*"], [:ELEM, "Hiroko Shimizu"],
      [:SEGEND, "~"]
    ]
  ],
  OID: [
    [
      [:SEGSTART, "OID"],
      [:ELEMSEP, "*"], [:ELEM, "333591"],
      [:SEGEND, "~"]
    ]
  ],
  SE: [
    [
      [:SEGSTART, "SE"],
      [:ELEMSEP, "*"], [:ELEM, "10"],
      [:ELEMSEP, "*"], [:ELEM, "604150077"],
      [:SEGEND, "~"]
    ]
  ],
  GE: [
    [
      [:SEGSTART, "GE"],
      [:ELEMSEP, "*"], [:ELEM, "10"],
      [:ELEMSEP, "*"], [:ELEM, "598951"],
      [:SEGEND, "~"]
    ]
  ],
  IEA: [
    [
      [:SEGSTART, "IEA"],
      [:ELEMSEP, "*"], [:ELEM, "1"],
      [:ELEMSEP, "*"], [:ELEM, "000952061"],
      [:SEGEND, "~"]
    ]
  ]
}.freeze

PARSER_SEGMENT_EXAMPLES = {
  ISA: [
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
    ]
  ],
  GS: [
    [
      ["AA", 1],
      ["64GVCAJ68Y", 2],
      ["2L0CIJM03G", 3],
      ["20220920", 4],
      ["084151", 5],
      ["598951", 6],
      ["T", 7],
      ["004010", 8]
    ]
  ],
  ST: [
    [
      ["204", 1],
      ["386417176", 2]
    ]
  ],
  B2: [
    [
      ["", 1],
      ["", 2],
      ["", 3],
      ["", 4],
      ["", 5],
      ["11", 6]
    ]
  ],
  B2A: [
    [
      ["00", 1]
    ]
  ],
  MS3: [
    [
      ["8651", 1],
      ["1", 2]
    ]
  ],
  PLD: [
    [
      ["10", 1]
    ]
  ],
  LH6: [
    []
  ],
  NTE: [
    [
      ["", 1],
      ["Try to bypass the SCSI sensor, maybe it will generate the 1080p card!", 2]
    ],
    [
      ["", 1],
      ["If we override the bandwidth, we can get to the SMTP capacitor through the cross", 2]
    ]
  ],
  N1: [
    [
      ["01", 1],
      ["Valentina Santiago", 2]
    ],
    [
      ["01", 1],
      ["Yaakv Allen", 2]
    ]
  ],
  N3: [
    [
      ["1338 Zboncak Center", 1]
    ],
    [
      ["907 Torphy Fords", 1]
    ]
  ],
  N7: [
    [
      ["", 1],
      ["381981", 2]
    ]
  ],
  N7B: [
    []
  ],
  M7: [
    [
      ["158707", 1]
    ]
  ],
  S5: [
    [
      ["10", 1],
      ["AL", 2]
    ]
  ],
  G62: [
    [
      ["01", 1],
      ["20220227", 2]
    ],
    [
      ["01", 1],
      ["20211230", 2]
    ]
  ],
  AT8: [
    []
  ],
  AT5: [
    []
  ],
  N4: [
    []
  ],
  G61: [
    [
      ["1A", 1],
      ["Hiroko Shimizu", 2]
    ]
  ],
  OID: [
    [
      ["333591", 1]
    ]
  ],
  SE: [
    [
      ["10", 1],
      ["604150077", 2]
    ]
  ],
  GE: [
    [
      ["10", 1],
      ["598951", 2]
    ]
  ],
  IEA: [
    [
      ["1", 1],
      ["000952061", 2]
    ]
  ]
}.freeze
