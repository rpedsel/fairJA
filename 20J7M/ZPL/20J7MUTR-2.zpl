set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.2272, <2> 2.5092, <3> 44.5846, <4> 16.2169, <5> 14.7467, <6> 33.3477, <7> 7.2591, <8> 49.9448, <9> 3.898, <10> 41.6281, <11> 9.1649, <12> 31.3291, <13> 6.7234, <14> 32.7074, <15> 42.6791, <16> 2.5952, <17> 39.2793, <18> 14.1204, <19> 15.3793, <20> 0.5225;
param workload[JOB] := <1> 7.1307, <2> 45.1731, <3> 40.0764, <4> 38.5046, <5> 4.6442, <6> 32.9301, <7> 42.3327, <8> 28.642, <9> 22.059, <10> 48.9501, <11> 4.5522, <12> 1.9296, <13> 48.6477, <14> 38.3783, <15> 21.7701, <16> 3.0708, <17> 39.388, <18> 31.7847, <19> 34.6396, <20> 9.3025;
param capacity[MACHINE] := <1> 58.2757, <2> 58.2757, <3> 58.2757, <4> 58.2757, <5> 58.2757, <6> 58.2757, <7> 58.2757;

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
