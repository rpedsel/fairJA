set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.9769, <2> 45.8705, <3> 38.3492, <4> 5.832, <5> 14.4524, <6> 20.1459, <7> 38.9466, <8> 42.343, <9> 2.8955, <10> 37.5021, <11> 16.5582, <12> 31.2562, <13> 30.62, <14> 41.6335, <15> 25.8051, <16> 1.6007, <17> 45.8251, <18> 14.656, <19> 38.4097, <20> 45.821;
param workload[JOB] := <1> 5.6548, <2> 6.7728, <3> 6.1927, <4> 2.415, <5> 3.8016, <6> 4.4884, <7> 6.2407, <8> 6.5071, <9> 1.7016, <10> 6.1239, <11> 4.0692, <12> 5.5907, <13> 5.5335, <14> 6.4524, <15> 5.0799, <16> 1.2652, <17> 6.7694, <18> 3.8283, <19> 6.1976, <20> 6.7691;
param capacity[MACHINE] := <1> 10.87, <2> 10.87, <3> 10.87, <4> 10.87, <5> 10.87, <6> 10.87, <7> 10.87;

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
