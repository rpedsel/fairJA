set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.64, <2> 43.5294, <3> 36.898, <4> 39.9609, <5> 22.0393, <6> 28.8321, <7> 44.0831, <8> 15.6004, <9> 35.384, <10> 15.5991, <11> 48.314, <12> 9.0842, <13> 19.0964, <14> 1.8872, <15> 11.6555, <16> 34.6707, <17> 17.7689, <18> 38.5812, <19> 15.2461, <20> 35.9973;
param workload[JOB] := <1> 12.64, <2> 43.5294, <3> 36.898, <4> 39.9609, <5> 22.0393, <6> 28.8321, <7> 44.0831, <8> 15.6004, <9> 35.384, <10> 15.5991, <11> 48.314, <12> 9.0842, <13> 19.0964, <14> 1.8872, <15> 11.6555, <16> 34.6707, <17> 17.7689, <18> 38.5812, <19> 15.2461, <20> 35.9973;
param capacity[MACHINE] := <1> 526.8678, <2> 526.8678, <3> 526.8678, <4> 526.8678, <5> 526.8678, <6> 526.8678;

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
