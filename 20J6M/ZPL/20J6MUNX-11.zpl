set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.7797, <2> 26.5437, <3> 48.4117, <4> 22.4497, <5> 43.3527, <6> 30.5797, <7> 24.2591, <8> 34.0325, <9> 27.8692, <10> 11.9389, <11> 31.0442, <12> 30.9147, <13> 30.4291, <14> 6.6361, <15> 17.6809, <16> 19.8022, <17> 13.6855, <18> 31.119, <19> 1.6227, <20> 36.1606;
param workload[JOB] := <1> 5.9816, <2> 5.1521, <3> 6.9579, <4> 4.7381, <5> 6.5843, <6> 5.5299, <7> 4.9254, <8> 5.8337, <9> 5.2791, <10> 3.4553, <11> 5.5717, <12> 5.5601, <13> 5.5163, <14> 2.5761, <15> 4.2049, <16> 4.45, <17> 3.6994, <18> 5.5784, <19> 1.2739, <20> 6.0134;
param capacity[MACHINE] := <1> 98.8816, <2> 98.8816, <3> 98.8816, <4> 98.8816, <5> 98.8816, <6> 98.8816;

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
