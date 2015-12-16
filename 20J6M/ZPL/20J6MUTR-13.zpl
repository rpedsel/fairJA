set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.5404, <2> 46.891, <3> 34.6115, <4> 13.3619, <5> 22.1722, <6> 12.6719, <7> 12.9981, <8> 2.7943, <9> 40.0741, <10> 26.5949, <11> 3.9171, <12> 19.7257, <13> 13.6425, <14> 1.1689, <15> 29.7579, <16> 23.3362, <17> 33.766, <18> 36.9423, <19> 30.0374, <20> 43.0178;
param workload[JOB] := <1> 24.478, <2> 16.2402, <3> 1.9816, <4> 10.458, <5> 36.3539, <6> 1.3619, <7> 7.3969, <8> 40.3315, <9> 8.4779, <10> 39.6632, <11> 30.1818, <12> 37.4182, <13> 29.563, <14> 24.0501, <15> 46.7801, <16> 21.7671, <17> 27.4482, <18> 46.4908, <19> 46.9746, <20> 39.5324;
param capacity[MACHINE] := <1> 67.1187, <2> 67.1187, <3> 67.1187, <4> 67.1187, <5> 67.1187, <6> 67.1187;

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
