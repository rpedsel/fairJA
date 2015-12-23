set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.9534, <2> 15.9151, <3> 22.87, <4> 9.791, <5> 2.5078, <6> 7.0697, <7> 17.6989, <8> 11.5272, <9> 43.0187, <10> 42.3673, <11> 32.107, <12> 23.3282, <13> 39.4291, <14> 47.5036, <15> 16.4172, <16> 26.9965, <17> 36.0022, <18> 9.8891, <19> 48.272, <20> 1.2319;
param workload[JOB] := <1> 6.6297, <2> 3.9894, <3> 4.7823, <4> 3.1291, <5> 1.5836, <6> 2.6589, <7> 4.207, <8> 3.3952, <9> 6.5589, <10> 6.509, <11> 5.6663, <12> 4.8299, <13> 6.2793, <14> 6.8923, <15> 4.0518, <16> 5.1958, <17> 6.0002, <18> 3.1447, <19> 6.9478, <20> 1.1099;
param capacity[MACHINE] := <1> 93.5611, <2> 93.5611, <3> 93.5611, <4> 93.5611, <5> 93.5611, <6> 93.5611, <7> 93.5611;

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
