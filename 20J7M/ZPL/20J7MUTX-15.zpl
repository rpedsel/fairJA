set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.5186, <2> 25.4232, <3> 35.3001, <4> 29.2335, <5> 38.3831, <6> 27.544, <7> 27.4107, <8> 10.848, <9> 28.5168, <10> 36.3676, <11> 10.066, <12> 41.2407, <13> 33.9217, <14> 48.2547, <15> 41.2158, <16> 5.7633, <17> 2.5952, <18> 17.1964, <19> 32.0192, <20> 2.1485;
param workload[JOB] := <1> 6.1252, <2> 5.0421, <3> 5.9414, <4> 5.4068, <5> 6.1954, <6> 5.2482, <7> 5.2355, <8> 3.2936, <9> 5.3401, <10> 6.0306, <11> 3.1727, <12> 6.4219, <13> 5.8242, <14> 6.9466, <15> 6.42, <16> 2.4007, <17> 1.611, <18> 4.1469, <19> 5.6586, <20> 1.4658;
param capacity[MACHINE] := <1> 10.4922, <2> 10.4922, <3> 10.4922, <4> 10.4922, <5> 10.4922, <6> 10.4922, <7> 10.4922;

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
