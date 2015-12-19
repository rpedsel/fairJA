set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.9042, <2> 39.784, <3> 14.2939, <4> 42.0534, <5> 18.4563, <6> 2.4149, <7> 2.8438, <8> 31.1566, <9> 21.8005, <10> 25.4252;
param workload[JOB] := <1> 18.6092, <2> 19.4997, <3> 4.2204, <4> 15.9843, <5> 9.4203, <6> 8.0954, <7> 23.8734, <8> 46.4583, <9> 7.3886, <10> 15.5565;
param capacity[MACHINE] := <1> 169.1061, <2> 169.1061, <3> 169.1061;

var x[JM] binary;
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
