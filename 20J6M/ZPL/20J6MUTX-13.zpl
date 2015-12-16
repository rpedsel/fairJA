set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.172, <2> 12.1155, <3> 2.639, <4> 13.5479, <5> 36.8396, <6> 46.6089, <7> 8.9296, <8> 17.8668, <9> 24.2071, <10> 13.6093, <11> 29.587, <12> 40.7249, <13> 34.9622, <14> 26.5175, <15> 25.173, <16> 16.5795, <17> 25.2164, <18> 8.8834, <19> 20.6714, <20> 49.7899;
param workload[JOB] := <1> 3.3425, <2> 3.4807, <3> 1.6245, <4> 3.6807, <5> 6.0696, <6> 6.8271, <7> 2.9882, <8> 4.2269, <9> 4.9201, <10> 3.6891, <11> 5.4394, <12> 6.3816, <13> 5.9129, <14> 5.1495, <15> 5.0173, <16> 4.0718, <17> 5.0216, <18> 2.9805, <19> 4.5466, <20> 7.0562;
param capacity[MACHINE] := <1> 11.5534, <2> 11.5534, <3> 11.5534, <4> 11.5534, <5> 11.5534, <6> 11.5534;

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
