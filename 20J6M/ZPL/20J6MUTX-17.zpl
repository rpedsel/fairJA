set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.202, <2> 26.9022, <3> 25.0649, <4> 24.0805, <5> 38.4544, <6> 37.9351, <7> 32.969, <8> 44.8243, <9> 1.84, <10> 13.7333, <11> 36.1912, <12> 17.2045, <13> 16.4716, <14> 33.9758, <15> 3.0874, <16> 24.8343, <17> 24.2903, <18> 38.4136, <19> 15.679, <20> 10.2958;
param workload[JOB] := <1> 5.4039, <2> 5.1867, <3> 5.0065, <4> 4.9072, <5> 6.2012, <6> 6.1591, <7> 5.7419, <8> 6.6951, <9> 1.3565, <10> 3.7058, <11> 6.0159, <12> 4.1478, <13> 4.0585, <14> 5.8289, <15> 1.7571, <16> 4.9834, <17> 4.9285, <18> 6.1979, <19> 3.9597, <20> 3.2087;
param capacity[MACHINE] := <1> 11.9313, <2> 11.9313, <3> 11.9313, <4> 11.9313, <5> 11.9313, <6> 11.9313;

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
