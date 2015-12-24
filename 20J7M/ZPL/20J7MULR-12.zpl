set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.0424, <2> 37.0563, <3> 4.3385, <4> 36.8486, <5> 29.9863, <6> 44.8203, <7> 36.5856, <8> 41.3306, <9> 47.1069, <10> 17.6501, <11> 11.7927, <12> 12.6844, <13> 49.0071, <14> 42.6614, <15> 47.3588, <16> 8.3144, <17> 3.3951, <18> 1.3452, <19> 12.6915, <20> 27.0835;
param workload[JOB] := <1> 40.1946, <2> 49.5379, <3> 13.9911, <4> 13.4798, <5> 17.2336, <6> 7.4509, <7> 33.1245, <8> 34.3515, <9> 27.9926, <10> 49.5014, <11> 3.8838, <12> 9.8634, <13> 33.3603, <14> 28.89, <15> 45.3799, <16> 38.9984, <17> 47.2118, <18> 7.1239, <19> 1.7625, <20> 18.0146;
param capacity[MACHINE] := <1> 74.4781, <2> 74.4781, <3> 74.4781, <4> 74.4781, <5> 74.4781, <6> 74.4781, <7> 74.4781;

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
