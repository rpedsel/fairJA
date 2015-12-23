set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8645, <2> 49.496, <3> 25.8996, <4> 1.4169, <5> 17.352, <6> 11.3593, <7> 33.9112, <8> 3.3354, <9> 25.0655, <10> 35.4897, <11> 31.8661, <12> 13.1055, <13> 8.0388, <14> 29.7114, <15> 31.7185, <16> 44.4346, <17> 30.3361, <18> 14.3987, <19> 45.9416, <20> 45.4583;
param workload[JOB] := <1> 618.2434, <2> 2449.854, <3> 670.7893, <4> 2.0076, <5> 301.0919, <6> 129.0337, <7> 1149.9695, <8> 11.1249, <9> 628.2793, <10> 1259.5188, <11> 1015.4483, <12> 171.7541, <13> 64.6223, <14> 882.7673, <15> 1006.0632, <16> 1974.4337, <17> 920.279, <18> 207.3226, <19> 2110.6306, <20> 2066.457;
param capacity[MACHINE] := <1> 2519.9558, <2> 2519.9558, <3> 2519.9558, <4> 2519.9558, <5> 2519.9558, <6> 2519.9558, <7> 2519.9558;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
