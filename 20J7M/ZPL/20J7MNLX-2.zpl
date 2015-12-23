set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.9963, <2> 28.6962, <3> 22.1709, <4> 20.7598, <5> 28.1586, <6> 25.8085, <7> 21.1865, <8> 18.6966, <9> 25.5321, <10> 18.4188, <11> 20.0716, <12> 32.7113, <13> 29.4255, <14> 39.4812, <15> 28.9082, <16> 21.6986, <17> 20.1847, <18> 23.9601, <19> 23.9155, <20> 25.1854;
param workload[JOB] := <1> 4.69, <2> 5.3569, <3> 4.7086, <4> 4.5563, <5> 5.3065, <6> 5.0802, <7> 4.6029, <8> 4.324, <9> 5.0529, <10> 4.2917, <11> 4.4801, <12> 5.7194, <13> 5.4245, <14> 6.2834, <15> 5.3766, <16> 4.6582, <17> 4.4927, <18> 4.8949, <19> 4.8903, <20> 5.0185;
param capacity[MACHINE] := <1> 14.1727, <2> 14.1727, <3> 14.1727, <4> 14.1727, <5> 14.1727, <6> 14.1727, <7> 14.1727;

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
