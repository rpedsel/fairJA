set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.0155, <2> 16.19, <3> 31.002, <4> 23.0214, <5> 18.1851, <6> 26.3773, <7> 29.8518, <8> 21.8616, <9> 31.1018, <10> 30.3715, <11> 25.6916, <12> 29.7518, <13> 17.2603, <14> 29.7162, <15> 23.6195, <16> 13.6037, <17> 21.068, <18> 27.8174, <19> 21.3797, <20> 36.3581;
param workload[JOB] := <1> 46.8615, <2> 0.6302, <3> 24.3135, <4> 14.9055, <5> 5.616, <6> 22.9804, <7> 4.6073, <8> 49.8385, <9> 48.7471, <10> 13.1732, <11> 34.4022, <12> 41.4907, <13> 26.1483, <14> 6.0287, <15> 21.0311, <16> 44.885, <17> 10.6043, <18> 22.7286, <19> 44.5654, <20> 26.1073;
param capacity[MACHINE] := <1> 509.6648, <2> 509.6648, <3> 509.6648, <4> 509.6648, <5> 509.6648, <6> 509.6648;

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
