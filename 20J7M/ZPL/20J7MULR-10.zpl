set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.8564, <2> 47.9219, <3> 30.776, <4> 22.6465, <5> 4.5612, <6> 5.9826, <7> 21.4083, <8> 36.0151, <9> 40.2136, <10> 44.6229, <11> 43.672, <12> 47.7155, <13> 0.1933, <14> 16.1159, <15> 41.5649, <16> 33.6662, <17> 39.6931, <18> 25.6886, <19> 4.481, <20> 9.3951;
param workload[JOB] := <1> 3.7486, <2> 19.6044, <3> 1.3866, <4> 20.0616, <5> 20.4803, <6> 42.3887, <7> 22.8495, <8> 33.9956, <9> 44.9227, <10> 40.0548, <11> 23.6535, <12> 13.0591, <13> 12.3281, <14> 49.5188, <15> 21.5188, <16> 6.8018, <17> 26.2418, <18> 46.7807, <19> 3.2554, <20> 43.6549;
param capacity[MACHINE] := <1> 70.9008, <2> 70.9008, <3> 70.9008, <4> 70.9008, <5> 70.9008, <6> 70.9008, <7> 70.9008;

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
