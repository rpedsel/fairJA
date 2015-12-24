set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.3024, <2> 2.6844, <3> 25.4979, <4> 44.6412, <5> 24.1842, <6> 4.8717, <7> 3.0694, <8> 32.9895, <9> 47.1106, <10> 28.0848, <11> 18.4492, <12> 6.0451, <13> 39.6162, <14> 30.3434, <15> 13.1174, <16> 36.5187, <17> 43.2412, <18> 36.4966, <19> 22.6802, <20> 9.2662;
param workload[JOB] := <1> 20.3024, <2> 2.6844, <3> 25.4979, <4> 44.6412, <5> 24.1842, <6> 4.8717, <7> 3.0694, <8> 32.9895, <9> 47.1106, <10> 28.0848, <11> 18.4492, <12> 6.0451, <13> 39.6162, <14> 30.3434, <15> 13.1174, <16> 36.5187, <17> 43.2412, <18> 36.4966, <19> 22.6802, <20> 9.2662;
param capacity[MACHINE] := <1> 69.8872, <2> 69.8872, <3> 69.8872, <4> 69.8872, <5> 69.8872, <6> 69.8872, <7> 69.8872;

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
